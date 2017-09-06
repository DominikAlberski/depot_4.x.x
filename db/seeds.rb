# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
  Product.create!(title: "seeds sample title nr #{n}",
                  description: %(<p> Sample description from seeds </p>),
                  image_url: 'ruby.jpg',
                  price: rand(0..99.99))
end
