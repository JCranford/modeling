// Example taken from a lecture by C. Baum
// I have a copy of the lecture at ~/GitReps/modeling/stata/test/Baum_MataProgramming.pdf

program jeffcenter, rclass
    version 16.1
    syntax varlist(numeric) [if] [in], ///
                GENerate(string) [DOUBLE]
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
}
end

/*
The file jeffcenter.ado contains a Stata command, jeffcenter,
that takes a list of numeric variables and a mandatory generate()
option. The contents of that option are used to create new variable
names, which then are tested for validity with confirm new var, and
if valid generated as missing. The list of those new variables is
assembled in local macro newvars. The original varlist and the list
of newvars is passed to the Mata function centerv() along with
touse, the temporary variable that marks out the desired
observations.
*/
