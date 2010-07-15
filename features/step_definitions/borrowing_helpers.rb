module Cucumber

  module BorrowingHelpers
    def author_and_title_from_book_name(book_name)
      author, title = book_name.split(':')
      [ author.strip, title.strip ]
    end
  end

end

World(Cucumber::BorrowingHelpers)
