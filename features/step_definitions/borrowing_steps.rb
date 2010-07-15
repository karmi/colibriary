Pokud /^existuje čtenář.. jménem "([^"]*)" s platným průkazem$/ do |name|
  Reader.create :name => name, :card_id => 123
end

Pokud /^existuje neprezenční výtisk knihy "([^"]*)"$/ do |book|
  author, title = book.split(':')
  Book.create :author => author.strip, :title => title.strip, :borrowable => true
end

Pokud /^jsem na stránce "Knihy"$/ do
  visit books_path
end
