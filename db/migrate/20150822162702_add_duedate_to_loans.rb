class AddDuedateToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :duedate, :datetime
  end
end
