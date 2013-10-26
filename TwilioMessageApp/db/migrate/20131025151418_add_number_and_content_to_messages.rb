class AddNumberAndContentToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :number_to, :string
    add_column :messages, :content, :string
  end
end
