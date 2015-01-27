class Deduction < ActiveRecord::Base
  attr_accessible :deduction_mode, :deduction_type, :financial_year, :max_amount, :section, :section_limit

validates_presence_of :deduction_mode, :message => "deduction_mode cannot be blank"
validates_presence_of :deduction_type, :message => "deduction_type cannot be blank"
validates_presence_of :financial_year, :message => "financial_year cannot be blank"
validates_presence_of :max_amount, :message => "max_amount cannot be blank"
validates_presence_of :section, :message => "section cannot be blank"
validates_presence_of :section_limit, :message => "section_limit cannot be blank"



def self.search(search)
if search
    if search.is_a?(String)
       where('id LIKE ? or deduction_mode LIKE ? or deduction_type LIKE ? or financial_year LIKE ?', "%#{search}%" , "%#{search}%" , "%#{search}%", "%#{search}%")
    end
   else
       scoped
   end
end

end
