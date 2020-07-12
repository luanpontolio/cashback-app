Dir[Rails.root.join('app/services/**/*.rb')].each { |file|
  require file
}
