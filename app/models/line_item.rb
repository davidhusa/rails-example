class LineItem < ApplicationRecord
  belongs_to :campaign

  def billable_amount
    actual_amount + adjustments
  end
end
