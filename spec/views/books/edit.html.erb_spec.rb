require 'spec_helper'

describe "books/edit.html.erb" do
  before(:each) do
    @book = assign(:book, stub_model(Book,
      :new_record? => false
    ))
  end

  it "renders the edit book form" do
    render

    rendered.should have_selector("form", :action => book_path(@book), :method => "post") do |form|
    end
  end
end
