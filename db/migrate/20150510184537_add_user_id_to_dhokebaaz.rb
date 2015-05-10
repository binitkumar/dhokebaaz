class AddUserIdToDhokebaaz < ActiveRecord::Migration
  def change
    add_column :dhokebaazs, :user_id, :integer
  end
end
