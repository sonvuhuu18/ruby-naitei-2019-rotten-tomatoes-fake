class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.text :info
      t.references :tv_show, foreign_key: true

      t.timestamps
    end
  end
end
