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
    CrystalScientificLibrary.integral(of: f, between: 0, and: 2, with_n_steps: 10, using: "simpson").should be_close(4.4, 0.01)
  end

  it "Perform a simple integral from data in a list" do
    CrystalScientificLibrary.integral(of: [0.0, 1.0, 0.0, 1.0, 0.0], as_function_of: [0.0, 1.0, 2.0, 3.0, 4.0], using: "trapezoid").should eq 2
  end

  g = ->(x : Float64) { 3.0 }
  it "computes the accumulation function of a simple function" do
    (CrystalScientificLibrary.accumulation_function of: g, from: 0.0, to: 3.0, in_n_steps: 10, with_n_slices: 5, using: "trapezoid")
  end


end
