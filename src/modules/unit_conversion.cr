module CrystalScientificLibrary

    def self.convert_angle(theta : Float64, from : String, to : String)
        
        # We first convert theta into turns...
        case from
        when "radian"
            theta = theta / Math::TAU
        when "degree"
            theta = theta / 360
        when "arcminute"
            theta = theta / 21_600
        when "arcsecond"
            theta = theta / 1_296_000
        when "grad"
            theta = theta / 400
        when "turn"
            # Nothing changes
        when "hour angle"
            theta = theta / 24
        when "compass point"
            theta = theta / 32
        when "milliradian"
            theta = theta / (2000 * Math::PI)
        when "binary degree"
            theta = theta / 256
        when "pi radian"
            theta = theta / 2
        when "quadrant"
            theta = theta / 4
        when "sextant"
            theta = theta / 6
        when "hexacontade"
            theta = theta / 60
        when "zam"
            theta = theta / 224
        else
            raise "wrong value for angle unit!"
        end

        # ...to convert it into the unit of interest
        case to
        when "radian"
            theta = theta * Math::TAU
        when "degree"
            theta = theta * 360
        when "arcminute"
            theta = theta * 21_600
        when "arcsecond"
            theta = theta * 1_296_000
        when "grad"
            theta = theta * 400
        when "turn"
            # Nothing changes
        when "hour angle"
            theta = theta * 24
        when "compass point"
            theta = theta * 32
        when "milliradian"
            theta = theta * (2000 * Math::PI)
        when "binary degree"
            theta = theta * 256
        when "pi radian"
            theta = theta * 2
        when "quadrant"
            theta = theta * 4
        when "sextant"
            theta = theta * 6
        when "hexacontade"
            theta = theta * 60
        when "zam"
            theta = theta * 224
        else
            raise "wrong value for angle unit!"
        end

        return theta
    end

end