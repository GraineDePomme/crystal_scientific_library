require "./spec_helper"

describe CrystalScientificLibrary do

  it "converts angles from one unit to another" do
    (CrystalScientificLibrary.convert_angle theta: 1, from: "turn", to: "degree").should eq 360
    (CrystalScientificLibrary.convert_angle theta: 2 * Math::PI, from: "radian", to: "degree").should eq 360
  end

  test_2D_vector_empty = CrystalScientificLibrary::Vector2D.new()
  it "Testing the construction of a 2D vector with no parameters" do
    (test_2D_vector_empty.x).should eq 0
    (test_2D_vector_empty.y).should eq 0
    (test_2D_vector_empty.radius).should eq 0
    (test_2D_vector_empty.angle).should eq 0
  end

  test_2D_vector_1 = CrystalScientificLibrary::Vector2D.new(x: -1, y: 0)
  test_2D_vector_2 = CrystalScientificLibrary::Vector2D.new(radius: 2, angle: Math::PI)
  test_2D_vector_3 = CrystalScientificLibrary::Vector2D.new(x: 3, radius: 5)
  test_2D_vector_4 = CrystalScientificLibrary::Vector2D.new(y: 1, angle: (Math::PI / 2))
  it "Testing 2D vectors with different pair of parameters" do
    test_2D_vector_1.radius .should eq 1
    test_2D_vector_1.angle .should eq Math::PI

    test_2D_vector_2.x .should eq -2
    test_2D_vector_2.y .should eq 0

    test_2D_vector_3.y .should eq 4
    test_2D_vector_3.angle .should eq Math.acos(3/5)

    test_2D_vector_4.x .should eq 0
    test_2D_vector_4.radius .should eq 1
  end

end
