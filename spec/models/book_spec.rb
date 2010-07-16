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

  describe "as borrowable" do

    before(:each) do
      @book   = Book.create :author => 'Test', :title => 'Test'
      @reader = Reader.create :name => 'Test'
    end

    it "could be borrowed" do
      @book.should respond_to(:borrow_to)
    end

    it "is borrowed when it has a reader" do
      @book.borrow_to @reader.id
      @book.should respond_to(:reader)
      @book.reader.should == @reader
      @book.should be_borrowed
    end

    it "is not borrowed when does not have a reader" do
      @book.should respond_to(:reader)
      @book.should_not be_borrowed
    end

    it "records the date when borrowed" do
      now = Time.local(2010, 01, 01, 12, 00)
      Time.stub!(:now).and_return now
      @book.borrow_to @reader.id
      @book.borrowed_from.to_date.should == now.to_date
    end
  end

end
