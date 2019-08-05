class AddStatusToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :status, :integer
  end
end
