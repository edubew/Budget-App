class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :name
      t.integer :amount
      t.references :author, foreign_key: { to_table: 'users'}
      
      t.timestamps
    end
  end
end
