class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :name
      t.text :description
      t.boolean :searchable
      t.decimal :cost
      t.decimal :tax
      t.string :currency
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
