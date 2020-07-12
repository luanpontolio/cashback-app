module Operations
  module Offers
    class Base
      include ::Operation::Base

      attr_reader :offer, :result

      def initialize(offer = nil)
        @offer = offer
      end

      def validate_advertiser_name(value)
        return result.add_error(
          i18n_error_key(:advertiser_name)
        ) if Offer.find_by_advertiser_name(value || '').present?
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

      def validate_start_at(start_at)
        return result.add_error(
          i18n_error_key(:start_at)
        ) if start_at.blank? || DateTime.parse(start_at.to_s) <= DateTime.current
      end

      def validate_period_date(start_at, end_at)
        start_at = DateTime.parse(start_at.to_s) rescue ''
        end_at = DateTime.parse(end_at.to_s) rescue ''

        is_valid = start_at.blank? || (end_at.present? && end_at <= start_at)

        return result.add_error(
          i18n_error_key(:invalid_dates)
        ) if is_valid
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

      private

      def is_a_url?(uri)
        uri.kind_of? URI::HTTP
      end

      def i18n_error_key(key)
        "operations.offer.base.errors.#{key}"
      end
    end
  end
end
