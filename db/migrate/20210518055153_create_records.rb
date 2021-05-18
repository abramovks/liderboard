class CreateRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :records do |t|
      t.belongs_to :key
      t.string :user_name
      t.float :score, :default => 0
      t.timestamps
    end
  end
end
