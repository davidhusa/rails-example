require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  test "works with no filter" do
    get line_items_path
    assert_response :success

    assert_equal 3, assigns(:line_items).size
    assert_equal 3, assigns(:total_line_items)
    assert_equal 0, assigns(:page)
    assert_equal 0, assigns(:max_page)
    assert_equal 1050.661, assigns(:total_billable)
  end

  test "works with line item name filter" do
    get line_items_path(params: { name_filter: "Item" })
    assert_response :success

    assert_equal 2, assigns(:line_items).size
    assert_equal 2, assigns(:total_line_items)
    assert_equal 0, assigns(:page)
    assert_equal 0, assigns(:max_page)
    assert_equal 803.3240000000001, assigns(:total_billable)
  end

   test "works with campaign name filter" do
    get line_items_path(params: { campaign_name_filter: "Two" })
    assert_response :success

    assert_equal 2, assigns(:line_items).size
    assert_equal 2, assigns(:total_line_items)
    assert_equal 0, assigns(:page)
    assert_equal 0, assigns(:max_page)
    assert_equal 248.337, assigns(:total_billable)
  end

  test "work with both filters" do
    get line_items_path(params: { name_filter: "Item", campaign_name_filter: "Two" })
    assert_response :success

    assert_equal 1, assigns(:line_items).size
    assert_equal 1, assigns(:total_line_items)
    assert_equal 0, assigns(:page)
    assert_equal 0, assigns(:max_page)
    assert_equal 1.0, assigns(:total_billable)
  end
end
