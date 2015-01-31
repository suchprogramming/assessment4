require("spec_helper")

describe(Band) do
  it { should have_and_belong_to_many(:venues) }

  it("runs titlecase method on the band name before saving") do
    test_band = Band.create({ :name => "randomband" })
    expect(test_band.name()).to(eq("Randomband"))
  end

  it("validates name field") do
    test_band = Band.new({ :name => "" })
    expect(test_band.save()).to(eq(false))
  end
end
