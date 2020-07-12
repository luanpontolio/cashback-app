# This is an operation to update an offer.
# Input data:
# {advertiser_name: 'Luan Test', url: 'http://walmart.com', description: 'Something', start_at: '2020-07-03', end_at: '2020-07-06'}
#
module Operations
  module Offers
    class Update < Operations::Offers::Base

      def initialize(offer)
        super(offer)
      end

      def validate(params)
        validate_advertiser_name(params[:advertiser_name]) if offer.advertiser_name != params[:advertiser_name].to_s
        validate_url(params[:url]) if params[:url].present?
        validate_description(params[:description]) if params[:description].present?
        validate_start_at(params[:start_at]) if params[:start_at].present?
        validate_period_date(params[:start_at], params[:end_at]) if params[:end_at].present?
      end

      def process(params)
        update_offer(params)
        @result.assign(:offer, offer.reload)
      end

      private

      def validate_start_at(start_at)
        binding.pry
        return result.add_error(
          i18n_error_key(:start_at)
        ) unless DateTime.current <= DateTime.parse(start_at.to_s)
      end

      def update_offer(params)
        with_trasaction do
          offer.update(params)
          raise ActiveRecord::Rollback if result.failure?
        end
      end
    end
  end
end
