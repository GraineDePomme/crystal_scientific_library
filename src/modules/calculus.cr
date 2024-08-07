module CrystalScientificLibrary

    def self.integral(of f : Float64 -> Float64, between a : Float64, and b : Float64, with_n_steps n : Float64, using method : String = "trapezoid")
        result = 0

        case method
        when "trapezoid"
            h = (b - a) / n

            result = 0.5 * f.call(a) + 0.5 * f.call(b)
            (1...n).each do |k|
                result += f.call(a + k * h)
            end

            result *= h

        else
            raise "Invalid name for an integration method!"
        end
    end

    def self.integral(of f : Float64 -> Float64, between a : Float64, and b : Float64, 
                      with_absolute_error abs_error : Float64 = 0, with_relative_error rel_error : Float64 = 0,
                      using method : String = "trapezoid")

        # TODO : Implement adaptive integration methods!
    
    end

    def self.integral(of y : Array(Float64), as_function_of x : Array(Float64), using method : String =  "trapezoid")
        result = 0
        n = Math.min(y.size, x.size)
        
        case method
        when "trapezoid"

            (1...n).each do |k|
                result += (x[k] - x[k-1]) * 0.5 * (y[k] + y[k-1])
            end

        else
            raise "Invalid name for an integration method!"
        end

        return result
    end
end