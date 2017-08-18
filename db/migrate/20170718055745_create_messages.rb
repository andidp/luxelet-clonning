class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :enquiry, foreign_key: true
      t.string :from
      t.string :to
      t.string :subject
      t.text :body
      t.datetime :message_at

      t.timestamps
    end
  end
end
