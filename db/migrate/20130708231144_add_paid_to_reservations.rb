class AddPaidToReservations < ActiveRecord::Migration
  def self.up
    add_column :reservations, :paid, :integer, :default => 0
  end

  def self.down
    remove_column :reservations, :paid
  end
end
