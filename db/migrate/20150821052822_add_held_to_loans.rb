class AddHeldToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :held, :datetime
  end
end
