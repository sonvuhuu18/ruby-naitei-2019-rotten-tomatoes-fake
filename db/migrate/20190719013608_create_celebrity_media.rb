class CreateCelebrityMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :celebrity_media do |t|
      t.integer :role
      t.references :celebrity, foreign_key: true
      t.references :medium, foreign_key: true

      t.timestamps
    end
  end
end
