*! version 1.0.0

version 15
set matastrict on

mata:

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

end
