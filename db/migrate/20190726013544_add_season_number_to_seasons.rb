class AddSeasonNumberToSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :season_number, :integer
  end
end
