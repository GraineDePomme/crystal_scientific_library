module CrystalScientificLibrary

    struct Vector2D
        
        @x : Float64
        @y : Float64
        @radius : Float64
        @angle : Float64

        def initialize(x : Float64? = nil, y : Float64? = nil, radius : Float64? = nil, angle : Float64? = nil)
            # handling case when no arguments are given
            if x.nil? && y.nil? && radius.nil? && angle.nil?
                @x = 0.0
                @y = 0.0
                @radius = 0.0
                @angle = 0.0

                @x_is_uptodate = true
                @y_is_uptodate = true
                @radius_is_uptodate = true
                @angle_is_uptodate = true
            # Handling cases when 2 arguments are given
            elsif !x.nil? && !y.nil? && radius.nil? && angle.nil? 
                @x = x
                @y = y
                @radius = Math.sqrt(x**2 + y**2)
                @angle = Math.atan2(y, x)

                @x_is_uptodate = true
                @y_is_uptodate = true
                @radius_is_uptodate = true
                @angle_is_uptodate = true
            elsif x.nil? && y.nil? && !radius.nil? && !angle.nil? 
                @radius = radius
                @angle = angle
                @x = @radius * Math.cos(@angle)
                @y = Math.sqrt(@radius**2 - @x**2)

                @x_is_uptodate = true
                @y_is_uptodate = true
                @radius_is_uptodate = true
                @angle_is_uptodate = true
            elsif !x.nil? && y.nil? && !radius.nil? && angle.nil? 
                @x = x
                @radius = radius
                @y = Math.sqrt(@radius**2 - @x**2)
                @angle = Math.asin(@y / @radius)

                @x_is_uptodate = true
                @y_is_uptodate = true
                @radius_is_uptodate = true
                @angle_is_uptodate = true
            elsif !x.nil? && y.nil? && radius.nil? && !angle.nil? 
                @x = x
                @angle = angle
                @radius = @x / Math.cos(@angle)
                @y = Math.sqrt(@radius**2 - @x**2)

                @x_is_uptodate = true
                @y_is_uptodate = true
                @radius_is_uptodate = true
                @angle_is_uptodate = true
            elsif x.nil? && !y.nil? && !radius.nil? && angle.nil? 
                @y = y
                @radius = radius
                @x = @y = Math.sqrt(@radius**2 - @y**2)
                @angle = Math.asin(@y / @radius)

                @x_is_uptodate = true
                @y_is_uptodate = true
                @radius_is_uptodate = true
                @angle_is_uptodate = true
            elsif x.nil? && !y.nil? && radius.nil? && !angle.nil? 
                @y = y
                @angle = angle
                @radius = @y / Math.sin(@angle)
                @x = @y = Math.sqrt(@radius**2 - @y**2)

                @x_is_uptodate = true
                @y_is_uptodate = true
                @radius_is_uptodate = true
                @angle_is_uptodate = true
            else
                raise "Invalid number of arguments for 2D vector construction!"
            end

        end


        # Accessor for x
        # If x is up-to-date, we just return it, otherwise we need to update it with the
        # info we have.
        def x : Float64
            if @x_is_uptodate
                return @x
            else
                if @radius_is_uptodate && @angle_is_uptodate
                    @x = @radius * Math.cos(@angle)
                    @x_is_uptodate = true
                elsif @y_is_uptodate && @radius_is_uptodate
                    @x = Math.sqrt(@radius**2 - @y**2)
                    @x_is_uptodate = true
                elsif @y_is_uptodate && @angle_is_uptodate
                    @radius = @y / Math.sin(@angle)
                    @radius_is_uptodate = true
                    @x = @radius * Math.cos(@angle)
                    @x_is_uptodate = true
                else
                    raise "Not enough information in 2D vector to update x!"
                end

                return @x
            end
        end

        # Accessor for y
        # If y is up-to-date, we just return it, otherwise we need to update it with the
        # info we have.
        def y : Float64
            if @y_is_uptodate
                return @y
            else
                if @radius_is_uptodate && @angle_is_uptodate
                    @y = @radius * Math.sin(@angle)
                    @y_is_uptodate = true
                elsif @x_is_uptodate && @radius_is_uptodate
                    @y = Math.sqrt(@radius**2 - @x**2)
                    @y_is_uptodate = true
                elsif @x_is_uptodate && @angle_is_uptodate
                    @radius = @x / Math.cos(@angle)
                    @radius_is_uptodate = true
                    @y = @radius * Math.sin(@angle)
                    @y_is_uptodate = true
                else
                    raise "Not enough information in 2D vector to update y!"
                end

                return @y
            end
        end

        # Accessor for radius
        # If r is up-to-date, we just return it, otherwise we need to update it with the
        # info we have.
        def radius : Float64
            if @radius_is_uptodate
                return @radius
            else
                if @x_is_uptodate && @y_is_uptodate
                    @radius = Math.sqrt(@x**2 + @y**2)
                    @radius_is_uptodate = true
                elsif @x_is_uptodate && @angle_is_uptodate
                    @radius = @x / Math.cos(@angle)
                    @radius_is_uptodate = true
                elsif @y_is_uptodate && @angle_is_uptodate
                    @radius = @y / Math.sin(@angle)
                    @radius_is_uptodate = true
                else
                    raise "Not enough information in 2D vector to update y!"
                end

                return @radius
            end
        end
        
        # Accessor for angle
        # If angle is up-to-date, we just return it, otherwise we need to update it with the
        # info we have.
        def angle : Float64
            if @angle_is_uptodate
                return @angle
            else
                if @x_is_uptodate && @y_is_uptodate
                    @angle = Math.atan(@y / @x)
                    @angle_is_uptodate = true
                elsif @x_is_uptodate && @radius_is_uptodate
                    @angle = Math.acos(@radius / @x)
                    @radius_is_uptodate = true
                elsif @y_is_uptodate && @radius_is_uptodate
                    @angle = Math.asin(@radius / @y)
                    @angle_is_uptodate = true
                else
                    raise "Not enough information in 2D vector to update y!"
                end

                return @angle
            end
        end

    end

end