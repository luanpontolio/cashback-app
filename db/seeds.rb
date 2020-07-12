# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Offer.create(advertiser_name: 'Walmart', url: 'http://walmart.com', description: 'Something', start_at: DateTime.current + 3.hours, end_at: DateTime.current + 2.days)
Offer.create(advertiser_name: 'Amazon', url: 'http://amazon.com', description: 'Something', start_at: DateTime.current + 4.hours)
Offer.create(advertiser_name: 'Extra', url: 'http://extra.com', description: 'Something', start_at: DateTime.current + 4.hours)
