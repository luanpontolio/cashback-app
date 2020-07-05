require 'operation/base'
require 'operation/result'

Dir[Rails.root.join('app/operations/**/*.rb')].each { |file|
  require file
}
