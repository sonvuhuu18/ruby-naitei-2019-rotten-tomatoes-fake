class AddIndexToCelebrityMedia < ActiveRecord::Migration[5.2]
  def change
    add_index :celebrity_media, [:celebrity_id, :medium_id, :role]
  end
end
