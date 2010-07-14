class Book < ActiveRecord::Base
  validates_presence_of :author, :title
end
