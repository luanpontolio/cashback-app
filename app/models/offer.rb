class Offer < ApplicationRecord
  MAXIMUM_CHACTERES = 500.freeze

  validates :advertiser_name, :url,
    :description, :start_at, presence: true
  validates_length_of :description, maximum: MAXIMUM_CHACTERES


end
