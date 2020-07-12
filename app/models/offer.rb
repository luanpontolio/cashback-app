class Offer < ApplicationRecord
  MAXIMUM_CHACTERES = 500.freeze

  validates :advertiser_name, :url,
    :description, :start_at, presence: true

  enum state: [:disabled, :enabled]

  def start_at!
    self.start_at = DateTime.current
    self.state = :enabled
    self.save!
  end

  def end_at!
    self.end_at = DateTime.current
    self.state = :disabled
    self.save!
  end
end
