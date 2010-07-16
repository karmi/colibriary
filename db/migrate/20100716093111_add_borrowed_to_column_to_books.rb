class AddBorrowedToColumnToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :borrowed_to, :integer
  end

  def self.down
    remove_column :books, :borrowed
  end
end
