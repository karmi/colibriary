require 'spec_helper'

describe "books/new.html.erb" do
  before(:each) do
    assign(:book, stub_model(Book,
      :new_record? => true
    ))
  end

  it "renders new book form" do
    render

    rendered.should have_selector("form", :action => books_path, :method => "post") do |form|
    end
  end
end
