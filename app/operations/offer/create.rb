module Operations
  module Offer
    class Create
      include ::Operation::Base

      def validate(params)
        puts "ak"
      end

      def proccess(params)
        puts 'óokkkkkkk'
      end
    end
  end
end
