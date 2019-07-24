class AddPictureToCelebrities < ActiveRecord::Migration[5.2]
  def change
    add_column :celebrities, :portrait, :string
  end
end
