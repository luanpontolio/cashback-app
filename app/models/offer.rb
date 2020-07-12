class Offer < ApplicationRecord
  MAXIMUM_CHACTERES = 500.freeze

  validates :advertiser_name, :url,
    :description, :start_at, presence: true

  enum state: [:disabled, :enabled]

  def change!(value)
    self.start_at = DateTime.current
    self.state = value
    self.save!
  end
end
