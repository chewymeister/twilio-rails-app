class ChangeDecimalToInteger < ActiveRecord::Migration
  def change
    remove_column :transactions, :transaction_amount
    add_column :transactions, :transaction_amount, :integer
  end
end
