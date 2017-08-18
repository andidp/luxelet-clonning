class CreateEnquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :enquiries do |t|
      t.references :property, foreign_key: true
      t.datetime :checkin
      t.datetime :checkout
      t.datetime :reserved_at
      t.datetime :booked_at
      t.datetime :expired_at
      t.datetime :completed_at
      t.string :reference_number
      t.integer :number_of_adults
      t.integer :number_of_children
      t.integer :number_of_infants
      t.decimal :total_cost
      t.decimal :tax
      t.string :currency
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
