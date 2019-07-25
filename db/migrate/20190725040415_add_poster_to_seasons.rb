class AddPosterToSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :poster, :string
  end
end
