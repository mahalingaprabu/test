class SalaryType < ActiveRecord::Base
  attr_accessible :basic, :bonus, :description, :frequency, :id, :reimbursement, :taxable, :taxablelimit, :amount
end
