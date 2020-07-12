module Services
  module Offer
    class Base
      attr_reader :args

      def initialize(args = {})
        @args = args
      end

      def save(action: Operations::Offers::Create.new)
        operation = action.call(args)
        operation.errors.map!(&message_translate)
        operation
      end

      private

      def message_translate
        Proc.new do |error_key:, error_args:|
          I18n.translate(error_key)
        end
      end
    end
  end
end
