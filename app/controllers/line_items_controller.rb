class LineItemsController < ApplicationController
  PAGE_SIZE = 30

  def index
    set_line_items
    set_page(@line_items)
    set_grand_totals(@line_items, @page)

    @line_items_paginated = @line_items.offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
  end

  private
  def set_line_items
    @line_items = LineItem.joins(:campaign)
    @line_items = @line_items.where("UPPER(line_items.name) like ?", "%#{params[:name_filter].upcase}%") if params[:name_filter].present?
    @line_items = @line_items.where("UPPER(campaigns.name) like ?", "%#{params[:campaign_name_filter].upcase}%") if params[:campaign_name_filter].present?
  end

  def set_page(line_items)
    @max_page = (line_items.count.to_f / PAGE_SIZE).to_i
    @page = params[:page].present? ? params[:page].to_i : 0
  end

  def set_grand_totals(line_items, page)
    return unless page.zero?

    @total_billable = line_items.sum("actual_amount + adjustments")
    @total_line_items = line_items.count
  end
end
