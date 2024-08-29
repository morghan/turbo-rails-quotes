require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first) # Reference to the first fixture quote
  end

  test "Creating new quote" do
    # When visiting the quotes#index page
    # expect to see the title with the text "Quotes"
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # When clicking the button with the text "New quote"
    # expect to see the title with the text "New Quote"
    click_on "New quote"
    assert_selector "h1", text: "New quote"

    # When filling the name input with "Capybara quote"
    # and clicking on "Create quote"
    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"

    # Expect to be back on the page with the title "Quotes"
    # and to see "Capybara quote" text in the list
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Showing a quote" do
    visit quotes_path

    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
