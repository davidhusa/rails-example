require "test_helper"

class LineItemTest < ActiveSupport::TestCase
  test "billable amount works" do
    LineItem.all.each do |line_item|
      assert_equal line_item.actual_amount + line_item.adjustments, line_item.billable_amount 
    end
  end

  test "associations work" do
    LineItem.all.each do |line_item|
      assert line_item.campaign.present?
    end
  end
end
