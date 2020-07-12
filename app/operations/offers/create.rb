# This is an operation to create a new offer.
# Input data:
# {
#   advertiser_name: 'Test',
#   url: 'http://walmart.com',
#   description: 'Something',
#   start_at: '2020-07-03T10:00:00',
#   end_at: '2020-07-06T14:00:00'
# }
#
module Operations
  module Offers
    class Create < Operations::Offers::Base
      def validate(params)
        validate_advertiser_name(params[:advertiser_name])
        validate_url(params[:url])
        validate_description(params[:description])
        validate_start_at(params[:start_at])
        validate_period_date(params[:start_at], params[:end_at])
      end

      def process(params)
        create_offer(params)
        @result.assign(:offer, offer)
      end

      private

      def create_offer(params)
        with_trasaction do
          offer = Offer.new(params)
          offer.save!
          raise ActiveRecord::Rollback if result.failure?
        end
      end
    end
  end
end
