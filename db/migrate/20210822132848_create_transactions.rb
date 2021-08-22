# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :created
      t.boolean :paid
      t.integer :amount
      t.string :currency
      t.boolean :refunded

      t.timestamps
    end
  end
end
