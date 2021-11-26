# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

Page.delete_all
ToolType.delete_all
Type.delete_all
Tool.delete_all
ProducerCompany.delete_all

filename = Rails.root.join("db/tools.csv")

puts "Tools from csv are #{filename}"
csv_data = File.read(filename)
tools = CSV.parse(csv_data, headers: true, encoding: "utf-8")

tools.each do |m|
  # puts m["name"]
  producer_company = ProducerCompany.find_or_create_by(name: m["producer"])

  if producer_company && producer_company.valid?
    # create tool here
    tool = producer_company.tools.create(
      name:        m["name"],
      description: m["description"],
      price:       m["price"],
      quantity:    m["amount"]
    )

    if tool&.valid?
      types = m ["type"].split(",").map(&:strip)
      types.each do |type_name|
        type = Type.find_or_create_by(name: type_name)
        ToolType.create(tool: tool, type: type)
      end

    else
      puts "Invalid tool #{m['name']}"
    end

    # puts "Invalid tool #{m['name']}" unless tool&.valid?

    # name:string description:text price:decimal quantity:integer producer_company:references
    # name,type,producer,price,amount,description

  else
    puts "Not a valid producer company, #{m['producer']} for tool #{m['name']}"
  end
end

Page.create(
  title:     "Contact Info",
  content:   "If you have suggestions how to we could improve the site and have any comments",
  permalink: "contact"
)

Page.create(
  title:     "About Scott Depot",
  content:   "Scott Depot sells only the best quality tools from the best brands out there",
  permalink: "about_scott_depot"
)

NUMBER_OF_TYPES = 4
TOOLS_PER_TYPE = 4

# Horse.destroy_all
# Breed.destroy_all

NUMBER_OF_TYPES.times do
  type = Type.create(name: Faker::Creature::Horse.unique.breed)

  TOOLS_PER_TYPE.times do
    tool = type.tools.create(
      name: Faker::Creature::Horse.unique.name
    )
    query = URI.encode_www_form_component([tool.name, type.name].join(","))
    downloaded_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
    tool.image.attach(io:       downloaded_image,
                      filename: "m-#{[tool.name,
                                      type.name].join('-')}.jpg")
    sleep(1)
  end
end

# puts "Created #{Breed.count} Breeds."
# puts "Created #{Horse.count} Horses."

puts "created Producer Companies #{ProducerCompany.count}"
puts "created Tools : #{Tool.count}"

puts "created Types : #{Type.count}"
puts "created Tool types : #{ToolType.count}"
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
