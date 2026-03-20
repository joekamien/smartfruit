# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'json'
json_str = '[{"name":"Apple","colors":["red","green","yellow"],"in_season":true},{"name":"Orange","colors":["orange"],"in_season":true},{"name":"Grapes","colors":["purple","green"],"in_season":false},{"name":"Lime","colors":["green"],"in_season":false},{"name":"Banana","colors":["yellow"],"in_season":false},{"name":"Watermelon","colors":["red"],"in_season":false},{"name":"Blueberry","colors":["blue"],"in_season":true},{"name":"Coconut","colors":["white"],"in_season":true}]'

data = JSON.parse(json_str)
Fruit.create(data)
