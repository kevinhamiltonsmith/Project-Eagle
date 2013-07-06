class CreatePromos < ActiveRecord::Migration
  def self.up
    create_table :promos do |t|
      t.integer :days
      t.integer :num_golfers
      t.string :promo_type
      t.integer :promo_dollars_off
      t.integer :promo_percent_off

      t.timestamps
    end
  end

  def self.down
    drop_table :promos
  end
end
