class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies do |t|
      t.integer :source
      t.string :from, :to
      t.decimal :rate
      t.date :date
      t.timestamps
    end
  end
end
