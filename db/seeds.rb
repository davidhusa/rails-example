# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
seed_file = File.open("./db/seed/line_item_data.json")
seed_data = JSON.load(seed_file)

campaign_data = {}
line_item_data = []

seed_data.each do |datum|
  campaign_data[datum["campaign_id"]] ||= { 
    id: datum["campaign_id"],
    name: datum["campaign_name"]
  }

  line_item_data << {
    campaign_id: datum["campaign_id"],
    name: datum["line_item_name"],
    booked_amount: datum["booked_amount"],
    actual_amount: datum["actual_amount"],
    adjustments: datum["adjustments"]
  }
end

Campaign.insert_all(campaign_data.values)
LineItem.insert_all(line_item_data)


# {"id"=>1, "campaign_id"=>1, "campaign_name"=>"Satterfield-Turcotte : Multi-channelled next generation analyzer - e550", 
#  "line_item_name"=>"Awesome Plastic Car - 6475", "booked_amount"=>430706.6871532752, "actual_amount"=>401966.50504006835, "adjustments"=>1311.0731142230268}
