class AddBorrowedFromToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :borrowed_from, :date
  end

  def self.down
    remove_column :books, :borrowed_from
  end
end
