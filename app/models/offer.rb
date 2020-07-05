class Offer < ApplicationRecord

  validates :advertiser_name, :url,
    :description, :start_at, presence: true
end
