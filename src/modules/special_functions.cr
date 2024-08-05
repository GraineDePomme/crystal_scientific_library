module CrystalScientificLibrary

    def self.factorial(n : Int32) : Int64
        result = 1
        n.downto(1) do |i|
            result = result * i
        end

        return result
    end

    def binomial_coefficient(n : Int32, k : Int32) : Int64
        return factorial(n) / (factorial(k) * factorial(n - k))
    end

end