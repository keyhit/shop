# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Setting.create(set_key: 'username', set_value: '_slavka')
Setting.create(set_key: 'domain', set_value: 'bigmir.net')
Setting.create(set_key: 'phone', set_value: '06969490444')

categories = %w[Smartphones Tablets Laptops Accessories Kitchen Home Rest Traver Tools]

short_description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'

full_description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
preview_image = 'samsung2'

categories.each do |category|
  category = Category.create(name: category)
  20.times do
    Product.create(
      title: 'Samsung Galaxy A7 2017',
      price: rand(1.0..10000.0).round(2),
      short_description: short_description,
      full_description: full_description,
      in_stock: true,
      preview_image: preview_image,
      category_id: category.id
    )
  end
end
