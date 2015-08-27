class AddLoaneddateToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :loaneddate, :datetime
  end
end
