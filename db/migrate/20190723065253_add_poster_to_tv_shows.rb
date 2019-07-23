class AddPosterToTvShows < ActiveRecord::Migration[5.2]
  def change
    add_column :tv_shows, :poster, :string
  end
end
