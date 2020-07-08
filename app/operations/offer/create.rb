# This is an operation to create a new offer.
# Input data:
# {
#   advertiser_name: 'Walmart',
#   url: 'http://walmart.com',
#   description: 'Something',
#   start_at: '2020-07-03T10:00:00',
#   end_at: '2020-07-06T14:00:00'
# }
#
module Operations
  module Offer
    class Create
      class << self
        include ::Operation::Base

        def validate(params)
          validate_advertiser_name(params[:advertiser_name])
          validate_url(params[:url])
          validate_description(params[:description])
          validate_datetime(params[:start_at], params[:end_at])
        end

        def process(params)
          binding.pry
          result.assign(:offer, create_offer(params))
        end

        private

        def validate_advertiser_name(value)
          return result.add_error(
            i18n_error_key(:advertiser_name)
           ) if value.blank? || ::Offer.find_by_advertiser_name(value).present?
        end

        def validate_url(value)
          return result.add_error(
            i18n_error_key(:url)
          ) if !is_a_url?(URI.parse(value.to_s))
        end

        def validate_description(value)
          return result.add_error(
            i18n_error_key(:description)
          ) if value.blank? || value.length >= ::Offer::MAXIMUM_CHACTERES
        end

        def validate_datetime(start_at, end_at)
          start_at = DateTime.parse(start_at.to_s) rescue ''
          end_at = DateTime.parse(end_at.to_s) rescue ''

          return result.add_error(
            i18n_error_key(:end_at_bigger)
          ) if start_at.blank? || (end_at.present? && end_at <= start_at)
        end

        def create_offer(params)
          offer = nil
          with_trasaction do
            offer = ::Offer.new(params)
            binding.pry
            offer.save!
            raise ActiveRecord::Rollback if result.failure?
          end

          offer
        end

        def i18n_error_key(key)
          "operations.offer.create.errors.#{key}"
        end

        def is_a_url?(uri)
          uri.kind_of? URI::HTTP
        end

        protected

        def with_trasaction(&block)
          ActiveRecord::Base.transaction do
            begin
              yield
            rescue => error
              binding.pry
              @error = error
              raise ActiveRecord::Rollback
            end
          end
        end
      end
    end
  end
end
