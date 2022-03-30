class CreateDeals < ActiveRecord::Migration[6.1]
  def change
    create_table :deals do |t|
      t.datetime :time
      t.integer :money

      t.timestamps
    end
  end
end
