class Reader < ActiveRecord::Base
  validates_presence_of :name
  has_many :books, :class_name => "Book", :foreign_key => "borrowed_to"
end
