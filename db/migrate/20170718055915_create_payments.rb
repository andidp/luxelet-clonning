class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.references :enquiry, foreign_key: true
      t.decimal :amount
      t.string :currency
      t.datetime :payment_at

      t.timestamps
    end
  end
end
