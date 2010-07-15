require 'spec_helper'

describe "books/show.html.erb" do
  before(:each) do
    @book = assign(:book, stub_model(Book))
  end

  it "renders attributes in <p>" do
    render
  end
end
