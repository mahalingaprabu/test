class SalaryStructure < ActiveRecord::Base
  attr_accessible :basicpay, :bonus, :ca, :da, :empid, :empname, :gross_salary, :hra, :leavetransallowance, :medical, :sa, :salaryded, :esi

validates_presence_of :basicpay, :message => "Emp Id cannot be blank"
validates_presence_of :bonus, :message => "Employee's name cannot be blank"
validates_presence_of :empid, :message => "Emp Id cannot be blank"
validates_presence_of :empname, :message => "Employee's name cannot be blank"
validates_presence_of :ca, :message => "Conveyance allowance cannot be blank"
validates_presence_of :da, :message => "Dearness allowance cannot be blank"
validates_presence_of :hra, :message => "Home rent allowance cannot be blank otherwise put 0"
validates_presence_of :leavetransallowance, :message => "leave travel allowance cannot be blank otherwise put 0"
validates_presence_of :medical, :message => "medical reimbursement cannot be blank otherwise put 0"
validates_presence_of :sa, :message => "Salary allowance cannot be blank otherwise put 0"


validates_numericality_of :basicpay, :only_integer => true, :greater_than_or_equal_to => 0, :message => "Please enter a valid numerical value for basicpay"
validates_numericality_of :bonus, :only_integer => true, :greater_than_or_equal_to => 0, :message => "Please enter a valid numerical value for
bonus"
validates_numericality_of :ca, :only_integer => true, :greater_than_or_equal_to => 0, :message => "Please enter a valid numerical value for Conveyance allowance "
validates_numericality_of :da, :only_integer => true, :greater_than_or_equal_to => 0, :message => "Please enter a valid numerical value for Dearness allowance"
validates_numericality_of :hra, :only_integer => true, :greater_than_or_equal_to => 0, :message => "Please enter a valid numerical value for Home rent allowance"
validates_numericality_of :leavetransallowance, :only_integer => true, :greater_than_or_equal_to => 0, :message => "Please enter a valid numerical value for leave travel allowance"
validates_numericality_of :medical, :only_integer => true, :greater_than_or_equal_to => 0, :message => "Please enter a valid numerical value for medical reimbursement"
validates_numericality_of :sa, :only_integer => true, :greater_than_or_equal_to => 0, :message => "Please enter a valid numerical value for Salary allowance"


belongs_to :employee


def self.search(search)
if search
    if search.is_a?(String)
       where('empid LIKE ? or empname LIKE ? or basicpay LIKE ? or gross_salary LIKE ?', "%#{search}%" , "%#{search}%" , "%#{search}%", "%#{search}%")
    end
   else
       scoped
   end
end
end
