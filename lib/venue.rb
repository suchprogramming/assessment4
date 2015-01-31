class Venue < ActiveRecord::Base
  has_and_belongs_to_many :bands
  validates(:name, {:presence => true, :length => {:maximum => 30}})
  before_save(:titlecase_venue_name)

  private

  define_method(:titlecase_venue_name) do
    self.name=(name().titlecase())
  end
end
