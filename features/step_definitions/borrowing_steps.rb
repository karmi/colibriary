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

Když /^vyplním číslo průkazu čtenářky jménem "([^"]*)" u knihy "([^"]*)"$/ do |reader_name, book_name|
  author, title = book_name.split(':')
  reader = Reader.find_by_name(reader_name)
  book   = Book.find_by_author_and_title(author.strip, title.strip)
  fill_in dom_id(book, :borrower_card_id_for), :with => reader.card_id     #borrower_card_id_for_book_1
end
