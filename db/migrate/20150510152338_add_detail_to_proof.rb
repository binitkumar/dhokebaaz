class AddDetailToProof < ActiveRecord::Migration
  def change
    add_column :proofs, :detail, :text
  end
end
