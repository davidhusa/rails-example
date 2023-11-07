class LineItemsController < ApplicationController
  PAGE_SIZE = 250

  def index
    @line_items = LineItem.includes(:campaign)
    @max_page = LineItem.count.to_f / PAGE_SIZE
    @page = params[:page].present? ? params[:page].to_i : 0
    set_grand_totals(@line_items, @page)
    @line_items_paginated = @line_items.offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
  end

  private
  def set_grand_totals(line_items, page)
    return unless page.zero?

    @total_billable = line_items.sum("actual_amount + adjustments")
    @total_line_items = line_items.count
  end
end
