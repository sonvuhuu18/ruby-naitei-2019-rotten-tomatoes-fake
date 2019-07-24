class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.datetime :release_date
      t.float :critic_score
      t.float :audience_score
      t.text :info
      t.references :season, foreign_key: true

      t.timestamps
    end
  end
end
