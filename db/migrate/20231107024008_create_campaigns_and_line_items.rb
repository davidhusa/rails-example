class CreateCampaignsAndLineItems < ActiveRecord::Migration[7.1]
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
    end

    create_table :line_items do |t|
      t.integer :campaign_id, null: false
      t.string :name, null: false
      t.float :booked_amount, null: false
      t.float :actual_amount, null: false
      t.float :adjustments, null: false

      t.timestamps
    end
  end
end
