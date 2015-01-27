class SalaryDetails < ActiveRecord::Base
attr_accessible :basicpay, :bonus, :ca, :da, :empid, :empname, :gross_ded, :gross_salary, :hra, :incometax, :leavetransallowance, :medical, :month, :netsalary, :professionaltax, :sa, :salaryded, :year, :dayspaid, :daysinmonth, :esi, :salarydate

validates_presence_of :empid, :message => "Emp Id cannot be blank"
validates_presence_of :empname, :message => "Employee's name cannot be blank"
validates_presence_of :dayspaid, :message => "dayspaid cannot be blank"
validates_presence_of :daysinmonth, :message => "daysinmonth cannot be blank"

validates_numericality_of :dayspaid, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 31, :message => "Please enter a valid numerical value for days paid"
validates_numericality_of :daysinmonth, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 31, :message => "Please enter a valid numerical value for days in month"
 

belongs_to :employee


def self.search(search)
if search
    if search.is_a?(String)
       where('empid LIKE ? or empname LIKE ? or salarydate LIKE ? or netsalary LIKE ?', "%#{search}%" , "%#{search}%" , "%#{search}%", "%#{search}%")
    end
   else
       scoped
   end
end

end
