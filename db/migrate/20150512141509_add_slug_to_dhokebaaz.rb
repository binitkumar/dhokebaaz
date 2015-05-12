class AddSlugToDhokebaaz < ActiveRecord::Migration
  def change
    add_column :dhokebaazs, :slug, :string
  end
end
