class AddLastNameCityZipcodeToDhokebaaz < ActiveRecord::Migration
  def change
    add_column :dhokebaazs, :last_name, :string
    add_column :dhokebaazs, :city, :string
    add_column :dhokebaazs, :zipcode, :string
  end
end
