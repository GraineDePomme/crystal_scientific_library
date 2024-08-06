module CrystalScientificLibrary

    def self.convert_coordinates(from : String, to : String,
        x : Float64? = nil, y : Float64? = nil, z : Float64? = nil, 
        r : Float64? = nil, theta : Float64? = nil, phi : Float64? = nil)
        
        case from
        when "cartesian"

          case to
          when "polar"

            if x && y && !z && !r && !theta && !phi
              # 2D Cartesian to Polar
              r = Math.sqrt(x ** 2 + y ** 2)
              theta = Math.atan2(y, x)
              { r: r, theta: theta }
            else
              raise "Invalid input for 2D Cartesian to Polar conversion."
            end

          when "spherical"

            if x && y && z && !r && !theta && !phi
              # 3D Cartesian to Spherical
              r = Math.sqrt(x ** 2 + y ** 2 + z ** 2)
              theta = Math.atan2(y, x)
              phi = Math.atan2(Math.sqrt(x ** 2 + y ** 2), z)
              { r: r, theta: theta, phi: phi }
            else
              raise "Invalid input for 3D Cartesian to Spherical conversion."
            end

          else
            
            raise "Invalid target coordinate system to: #{to}"

          end

        when "polar"

          case to
          when "cartesian"

            if r && theta && !x && !y && !z && !phi
              # 2D Polar to Cartesian
              x = r * Math.cos(theta)
              y = r * Math.sin(theta)
              { x: x, y: y }
            else
              raise "Invalid input for 2D Polar to Cartesian conversion."
            end

          else

            raise "Invalid target coordinate system to: #{to}"

          end

        when "spherical"

          case to
          when "cartesian"

            if r && theta && phi && !x && !y && !z
              # 3D Spherical to Cartesian
              x = r * Math.cos(theta) * Math.sin(phi)
              y = r * Math.sin(theta) * Math.sin(phi)
              z = r * Math.cos(phi)
              { x: x, y: y, z: z }
            else
              raise "Invalid input for 3D Spherical to Cartesian conversion."
            end

          else

            raise "Invalid target coordinate system to: #{to}"

          end
          
        else

          raise "Invalid source coordinate system from: #{from}"

        end
      end

end