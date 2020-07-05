module Operation
  module Base
    attr_accessor :result, :logger

    def call(params = {}, logger = Rails.logger)
      @logger ||= logger
      @result ||= Operation::Result.new
      run(params)
      result
    end

    def run(params = {})
      return unless result.success?

      params = params.to_h.with_indifferent_access

      catch :break do
        self.validate(params)
        self.process(params) if result.success?
      end
      result.success?
    rescue StandardError => e
      logger.error(e.message)
      logger.error(e.backtrace)
      result.add_error('operations.standard_error', error_class: e.class, error_message: e.message)
    end

    def process(params)
      raise NotImplementedError,
        "You should implement method:\n process(params)"
    end

    def validate(params); end
  end
end
