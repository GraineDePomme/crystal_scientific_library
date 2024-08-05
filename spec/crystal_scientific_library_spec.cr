require "./spec_helper"

describe CrystalScientificLibrary do

  it "converts angles from one unit to another" do
    (CrystalScientificLibrary.convert_angle theta: 1, from: "turn", to: "degree").should eq 360
    (CrystalScientificLibrary.convert_angle theta: 2 * Math::PI, from: "radian", to: "degree").should eq 360
  end
end
