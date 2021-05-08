// A test program used SOLELY for experimentation at this point
// 2020.07.26 I have added some (silly) MATA code ...
// quietly program drop test1

program test1, rclass
    version 16.0
    syntax anything [if] [in] [, CLean]
    marksample touse
    quietly count if `touse'
    if `r(N)' == 0 {
        error 2000
    }
    
    mata: hello()
    mata: myPrinter("------------------------")
    if ("`clean'" == "clean") {
        noisily list `anything' if `touse', clean
    }
    else {
        noisily list `anything' if `touse'
    }
    
    mata: myPrinter("This is a simple test message only.")
    mata: my_goodbye()
end



version 16
mata:
void hello() {
    printf("Hello there.\n")
}

void myPrinter(string msg) {
    printf("%s\n",msg)
}

void my_goodbye() {
    printf("Goodbye.\n")
}


/* let's comment out the EarthDistance code for now ...
// A few useless (for our current purposes) functions from 'The Mata Book'
class EarthDistance
{
    public:
        real scalar  distance()

    private:
        real scalar  radians()      // radians from degrees
        real scalar  hav()          // haversine function
        real scalar  invhav()       // inverse haversine function
}

real scalar EarthDistance::distance(real vector pos1,
                                    real vector pos2)
{
        real scalar  dlon, dlat
        real scalar  lat1, lat2
        real scalar  lon1, lon2
        real scalar  h, radius

        radius = 3961               // radius of Earth, in miles

        lat1 = radians(pos1[1])
        lon1 = radians(pos1[2])

        lat2 = radians(pos2[1])
        lon2 = radians(pos2[2])

        dlon = lon2 - lon1
        dlat = lat2 - lat1

        h = hav(dlat) + cos(lat1)*cos(lat2)*hav(dlon)
        if (h>1) return(.)

        return(radius*invhav(h))
}

real scalar EarthDistance::hav(real scalar theta)
                              return((1-cos(theta))/2)

real scalar EarthDistance::invhav(real scalar h)
                              return(2*asin(sqrt(h)))

real scalar EarthDistance::radians(real scalar d)
                              return(d*(pi()/180))
... end of the commenting for EarthDistance coding*/    
end
