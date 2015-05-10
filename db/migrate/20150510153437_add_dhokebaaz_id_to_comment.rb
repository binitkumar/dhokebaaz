class AddDhokebaazIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :dhokebaaz_id, :integer
  end
end
