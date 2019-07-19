class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :reviewable_type
      t.integer :reviewable_id

      t.timestamps
    end
  end
end
