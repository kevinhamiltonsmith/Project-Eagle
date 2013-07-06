class AddPaidToReservations < ActiveRecord::Migration
  def self.up
  	add_column "reservations", "paid", :string, :default => "n"
  end

  def self.down
	remove_column "reservations", "paid"
  end
end
