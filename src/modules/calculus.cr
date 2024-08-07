module CrystalScientificLibrary

    def self.integral(of f : Float64 -> Float64, between a : Float64, and b : Float64, with_n_steps n : Int32, using method : String = "trapezoid")
        result = 0

        case method
        when "trapezoid"
            h = (b - a) / n

            result = 0.5 * f.call(a) + 0.5 * f.call(b)
            (1...n).each do |k|
                result += f.call(a + k * h)
            end

            result *= h
        when "simpson"
            n = n + 1 if n.odd?
            h = (b - a) / n

            result += f.call(a) + f.call(b)
            (1...n).each do |k|
                if k.odd?
                    result += 4 * f.call(a + k * h)
                else
                    result += 2 * f.call(a + k * h)
                end
            end

            result *= (1/3) * h
        else
            raise "Invalid name for an integration method!"
        end

        return result
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

    def self.accumulation_function(of f : Float64 -> Float64, 
                                   from a : Float64, to b : Float64, 
                                   in_n_steps n_steps : Int32, with_n_slices n_slices : Int32, 
                                   using method : String = "trapezoid")
        result = [] of Float64
        delta_x = (b - a) / n_steps

        (0...n_steps).each do |k|
            if result.empty?
                result << integral of: f, between: (a + k * delta_x), and: (a + (k + 1) * delta_x), with_n_steps: n_slices, using: method
            else
                result << result[-1] + integral of: f, between: (a + k * delta_x), and: (a + (k + 1) * delta_x), with_n_steps: n_slices, using: method
            end
        end

        puts result
        return result
    end

        
end