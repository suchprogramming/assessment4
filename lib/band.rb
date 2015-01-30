class Band < ActiveRecord::Base
  has_and_belongs_to_many :venues
  validates(:name, {:presence => true, :length => {:maximum => 30}})
  before_save(:titlecase_band_name)

  private

  define_method(:titlecase_band_name) do
    self.name=(name().titlecase())
  end
end
