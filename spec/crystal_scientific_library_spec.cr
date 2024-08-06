require "./spec_helper"

describe CrystalScientificLibrary do

  it "converts angles from one unit to another" do
    (CrystalScientificLibrary.convert_angle theta: 1, from: "turn", to: "degree").should eq 360
    (CrystalScientificLibrary.convert_angle theta: 2 * Math::PI, from: "radian", to: "degree").should eq 360
  end

  it "converts various coodinate system from one to another" do
    CrystalScientificLibrary.convert_coordinates(x: -2, y: 0, from: "cartesian", to: "polar")["r"] .should eq 2
  end

  f = ->(x : Float64) { x**4 - 2 * x + 1 }
  it "performs a simple adaptive integration using trapezoids" do
    CrystalScientificLibrary.integral(of: f, between: 0, and: 2, with_n_steps: 100, using: "trapezoid").should be_close(4.4, 0.01)
  end

end
