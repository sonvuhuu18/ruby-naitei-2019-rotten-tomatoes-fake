class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.datetime :release_date
      t.float :critic_score
      t.float :audience_score
      t.text :info

      t.timestamps
    end
  end
end
