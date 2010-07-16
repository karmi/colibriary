Pokud /^existuje čtenář.. jménem "([^"]*)" s platným průkazem$/ do |name|
  Reader.create :name => name, :card_id => 123
end

Pokud /^existuje neprezenční výtisk knihy "([^"]*)"$/ do |book_name|
  author, title = author_and_title_from_book_name(book_name)
  Book.create :author => author, :title => title, :borrowable => true
end

Pokud /^jsem na stránce "Knihy"$/ do
  visit books_path
end

Když /^vyplním číslo průkazu čtenářky jménem "([^"]*)" u knihy "([^"]*)"$/ do |reader_name, book_name|
  author, title = author_and_title_from_book_name(book_name)
  reader = Reader.find_by_name(reader_name)
  book   = Book.find_by_author_and_title(author.strip, title.strip)
  fill_in dom_id(book, :borrower_card_id_for), :with => reader.card_id     #borrower_card_id_for_book_1
end

Když /^kliknu na tlačítko "([^"]*)" u knihy "([^"]*)"$/ do |button_name, book_name|
  author, title = author_and_title_from_book_name(book_name)
  book   = Book.find_by_author_and_title(author, title)
  box_for_book_id = '#' + dom_id(book, :box_for)     #box_for_book_1
  within box_for_book_id do
    click_button button_name
  end
end

Pak /^je kniha "([^"]*)" označena jako vypůjčená$/ do |book_name|
  author, title = author_and_title_from_book_name(book_name)
  book   = Book.find_by_author_and_title(author, title)
  box_for_book_id = '#' + dom_id(book, :box_for)     #box_for_book_1
  Pak %{bych měl vidět "vypůjčena" uvnitř prvku "#{box_for_book_id}"}
end

Pak /^datum výpůjčky knihy "([^"]*)" je dnes$/ do |book_name|
  author, title = author_and_title_from_book_name(book_name)
  book   = Book.find_by_author_and_title(author, title)
  box_for_book_id = '#' + dom_id(book, :box_for)     #box_for_book_1
  Pak %{bych měl vidět "#{Time.now.to_date.to_s(:format => 'short')}" uvnitř prvku "#{box_for_book_id}"}
end
