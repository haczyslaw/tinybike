class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :bike_id, null: false
      t.text :body, null: false

      t.index :bike_id
    end
  end
end
