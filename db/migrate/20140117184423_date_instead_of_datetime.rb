class DateInsteadOfDatetime < ActiveRecord::Migration
  def change
    remove_column :ride_offers, :date
    add_column :ride_offers, :date, :date
  end
end
