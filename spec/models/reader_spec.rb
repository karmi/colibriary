require 'spec_helper'

describe Reader do

  it "is not valid without a name" do
    @reader = Reader.create :name => nil
    @reader.should_not be_valid
  end

  it "has books" do
    @book   = Book.create :author => 'Test', :title => 'Test'
    @reader = Reader.create :name => 'Test'
    @book.update_attribute(:borrowed_to, @reader.id)
    @reader.should respond_to(:books)
    @reader.books.should == [@book]
  end

end
