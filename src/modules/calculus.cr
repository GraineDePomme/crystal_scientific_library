module CrystalScientificLibrary

    def self.integral(of f : Float64 -> Float64, between a : Float64, and b : Float64, 
                      with_n_steps n : Float64 = 0, with_absolute_error abs_error : Float64 = 0, with_relative_error rel_error : Float64 = 0,
                      using method : String = "trapezoid")

        result = 0

        if n != 0

            case method
                when "trapezoid"
                h = (b - a) / n

                result = 0.5 * f.call(a) + 0.5 * f.call(b)
                (1...n).each do |k|
                    result += f.call(a + k * h)
                end

                result *= h

            else
                # TODO : Implement other non adaptive methods
            end
        
        else

            # Perform an adaptive method
        
        end

        return result

    end

end