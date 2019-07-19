class CreateCelebrities < ActiveRecord::Migration[5.2]
  def change
    create_table :celebrities do |t|
      t.string :name
      t.datetime :date_of_birth
      t.integer :gender
      t.string :nationality

      t.timestamps
    end
  end
end
