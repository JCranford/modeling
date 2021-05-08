// Example .ADO file using Mata programming as well.

program jeffextrema, rclass
    version 16.1
    syntax varname(numeric) [if] [in]
    marksample touse
    mata: calcextrema("`varlist'", "`touse'")
    display as txt " min (`varlist') = " as res r(min)
    display as txt " max (`varlist') = " as res r(max)
    return scalar min = r(min)
    return scalar max = r(max)
end


version 16.1
mata:
mata set matastrict on

void calcextrema(string scalar varname, ///
                 string scalar touse)
{
    real colvector x, cmm
    st_view(x, ., varname, touse)
    cmm = colminmax(x)
    st_numscalar("r(min)", cmm[1])
    st_numscalar("r(max)", cmm[2])
    
}
end

