// again, another test Stata/Mata project

program mytest, rclass
    version 16
    syntax [anything] [if] [in] [, CLean]
    marksample touse
    quietly count if `touse'
    if `r(N)' == 0 {
        error 2000
    }
    
    mata: mymsg("This program will return a list of numbers and their squares.")
    forvalues i = 1(2)20 {
        
        di "Test `i' " as result `i'^2
    }
    
    
    
    
    
end

version 16
mata:

void    mymsg(string msg) {
    printf("%s\n",msg)
}

real scalar  mysquare(real scalar n1) {
    real scalar res = n1^2
    return res
}

end

