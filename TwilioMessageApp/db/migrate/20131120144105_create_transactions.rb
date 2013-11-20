class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :transaction_amount

      t.timestamps
    end
  end
end
