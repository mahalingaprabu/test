class Complaints < ActiveRecord::Base
  attr_accessible :assignto, :cdate, :description, :empid, :empname, :status, :summary, :ctype, :comments

validates_presence_of :assignto, :message => "Assignto field can't be blank"
validates_presence_of :description, :message => "Description cannot be blank"
validates_presence_of :empid, :message => "Employee Id cannot be blank"
validates_presence_of :empname, :message => "Employee Name cannot be blank"
validates_presence_of :summary, :message => "Summary cannot be blank"
validates_presence_of :ctype, :message => "Type field cannot be blank"

belongs_to :employee


def self.search(search)
if search
    if search.is_a?(String)
       where('empid LIKE ? or empname LIKE ? or cdate LIKE ? or ctype LIKE ?', "%#{search}%" , "%#{search}%" , "%#{search}%", "%#{search}%")
    end
   else
       scoped
   end
end

end





