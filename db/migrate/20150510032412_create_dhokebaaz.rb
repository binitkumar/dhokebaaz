class CreateDhokebaaz < ActiveRecord::Migration
  def change
    create_table :dhokebaazs do |t|
      t.text :story
      t.string :incident_time
      t.string :dhokebaaz_name
      t.text :address
      t.text :other_details
      t.text :fb_profile_url
      t.boolean :post_as_anonymous
      t.string :name
      t.string :email
      t.boolean :name_visible_to_public
      t.boolean :recive_update_on_comments
      t.boolean :recive_messages

      t.timestamps
    end
  end
end
