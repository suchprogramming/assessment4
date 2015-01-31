require("spec_helper")

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }

  it("runs titlecase method on the venue name before saving") do
    test_venue = Venue.create({ :name => "oklahoma city" })
    expect(test_venue.name()).to(eq("Oklahoma City"))
  end

  it("validates name field") do
    test_venue = Venue.new({ :name => "" })
    expect(test_venue.save()).to(eq(false))
  end
end
