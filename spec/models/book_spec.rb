require 'spec_helper'

describe Book do

  it "is not valid without an author" do
    @book = Book.create :author => nil, :title => 'Test'
    @book.should_not be_valid
  end

  it "is not valid without a title" do
    @book = Book.create :author => 'Test', :title => nil
    @book.should_not be_valid
  end

  it "is borrowable by default" do
    @book = Book.create :author => 'Test', :title => 'Test'
    @book.should be_borrowable
  end

end
