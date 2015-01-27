class Department < ActiveRecord::Base
  attr_accessible :depid, :depname

has_many :employees

def self.search(search)
if search
    if search.is_a?(String)
       where('depid LIKE ? or depname LIKE ?', "%#{search}%" , "%#{search}%")
    end
   else
       scoped
   end
end

end
