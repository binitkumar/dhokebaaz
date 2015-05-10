class AddPostAsAnonymasToComment < ActiveRecord::Migration
  def change
    add_column :comments, :post_as_anonymas, :boolean
  end
end
