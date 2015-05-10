class CreateProofs < ActiveRecord::Migration
  def change
    create_table :proofs do |t|
      t.references :dhokebaaz, index: true

      t.timestamps
    end
  end
end
