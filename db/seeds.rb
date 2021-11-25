# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

Page.delete_all
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
    puts "Invalid tool #{m['name']}" unless tool&.valid?

    # name:string description:text price:decimal quantity:integer producer_company:references
    # name,type,producer,price,amount,description

  else
    puts "Not a valid producer company, #{m['producer']} for tool #{m['name']}"
  end
end

Page.create(
  title:     "Contact Info",
  content:   "If you have suggestions as how to we could improve the site and have any comments please let us know",
  permalink: "contact"
)

Page.create(
  title:     "About Scott Depot",
  content:   "Scott Depot sells only the best quality tools from the best brands out there",
  permalink: "about_scott_depot"
)

puts "created Producer Companies #{ProducerCompany.count}"
puts "created Tools : #{Tool.count}"
