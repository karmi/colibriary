Pak /^bych měl vidět "([^"]*)" uvnitř prvku "([^"]*)"$/ do |text, selector|
  within(selector) do
    page.should have_content(text)
  end
end
