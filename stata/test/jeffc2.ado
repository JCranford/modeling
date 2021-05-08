// Example taken from a lecture by C. Baum
// I have a copy of the lecture at ~/GitReps/modeling/stata/test/Baum_MataProgramming.pdf
// THIS CODE BEARS CAREFUL STUDY!!
// I will attempt to have the ADO function, 'jeffc2' return not just the
//      new, 'centered' variable, but also return values in the 'r' matrix
//      which will return the mean and standard deviations of the involved
//      variables. (This will require some thought!)
// The initial versions will return simply scalars r(mean) and r(var) for 
//      FIRST variable in the list. (this is for MEAN and VARIANCE)
// ... as of 29JUL2020, this seems to work - for the first variable only!
// ... as of 29JUL2020 around 8:50 pm, ... it is *almost* working
//      the main trouble is the size of the 'variances' matrix returned.

program jeffc2, rclass
    version 16.1
    syntax varlist(numeric) [if] [in], GENerate(string) [DOUBLE]
    marksample touse
    quietly count if `touse'
    if `r(N)' == 0  error 2000
    foreach v of local varlist {
        confirm new var `generate'`v'
    }
    foreach v of local varlist {
        qui generate `double' `generate'`v' = .
        local newvars "`newvars' `generate'`v'"
    }
    mata: centerv("`varlist'", "`newvars'", "`touse'")
    
//     return scalar mymean = r(mean)
//     return scalar variance = r(variance)
    return matrix mymean = means
    return matrix variances = variances
end

version 16.1
mata:
void    centerv( string scalar varlist,   ///
                 string scalar newvarlist,
                 string scalar touse)
{
    real matrix X, Z
    st_view(X=., ., tokens(varlist), touse)
    st_view(Z=., ., tokens(newvarlist), touse)
    Z[ ., .] = X :- mean(X)       /* This is a Mata function */
//     st_numscalar("r(mean)", mean(X[., 1]))
//     st_numscalar("r(variance)", variance(X[., 1]))
    st_matrix("means", mean(X[., .]))
    st_matrix("variances", variance(X[., .]))
}
end

/*
The file jeffc2.ado contains a Stata command, jeffcenter,
that takes a list of numeric variables and a mandatory generate()
option. The contents of that option are used to create new variable
names, which then are tested for validity with confirm new var, and
if valid generated as missing. The list of those new variables is
assembled in local macro newvars. The original varlist and the list
of newvars is passed to the Mata function centerv() along with
touse, the temporary variable that marks out the desired
observations.
*/

/* I have modified the code further to experiment with various functions of Mata other than 'mean'.
I will likely change the title of the Mata function as well.
*/

