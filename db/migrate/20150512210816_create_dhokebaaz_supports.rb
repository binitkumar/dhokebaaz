class CreateDhokebaazSupports < ActiveRecord::Migration
  def change
    create_table :dhokebaaz_supports do |t|
      t.references :dhokebaaz, index: true
      t.references :user, index: true
      t.string :ip_address
      t.text :message
      t.boolean :post_as_anonymous

      t.timestamps
    end
  end
end
