class Book < ActiveRecord::Base
  validates_presence_of :author, :title
  belongs_to :reader, :class_name => "Reader", :foreign_key => "borrowed_to"

  def borrowed?
    !reader.nil?
  end
end
