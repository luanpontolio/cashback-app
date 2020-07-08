module Services
  module Offer
    class Base
      attr_reader :args

      def initialize(args = {})
        @args = args
      end

      def create
        operation = Operations::Offer::Create.call(args)
        operation.errors.map!(&message_translate).reject(&:blank?)
        operation
      end

      private

      def message_translate
        Proc.new do |error_key: nil, error_args: {}|
          I18n.translate(error_key)
        end
      end

    end
  end
end
