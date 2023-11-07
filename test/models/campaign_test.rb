require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  test "associations work" do
    Campaign.all.each do |campaign|
      assert campaign.line_items.present?
    end
  end
end
