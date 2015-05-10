class AddTagsToDhokebaaz < ActiveRecord::Migration
  def change
    add_column :dhokebaazs, :tags, :string
  end
end
