class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.string :item
      t.string :friend
      t.string :friend_phone
      t.string :picture
      t.string :dateloaned
      t.string :datedue

      t.timestamps null: false
    end
  end
end
