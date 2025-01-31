module Operation
  class Result
    attr_reader :errors

    def initialize
      @errors = []
      @data = {}
    end

    def success?
      errors.empty?
    end

    def failure?
      !success?
    end

    def break!
      throw :break
    end

    def abort!(message)
      self.add_error(message) if message
      break!
    end

    alias_method :error!, :abort!

    def add_error(error_key, error_args = {})
      errors << { error_key: error_key, error_args: error_args }
    end

    def assign(key, value)
      @data[key] = value
      value
    end

    def data
      @data.dup
    end
  end
end
