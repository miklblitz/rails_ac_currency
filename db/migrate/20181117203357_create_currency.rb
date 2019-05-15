class CreateCurrency < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.float :currency
      t.integer :source, null: false

      t.timestamps
    end
  end
end
