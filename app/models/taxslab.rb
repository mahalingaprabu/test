class Taxslab < ActiveRecord::Base
  attr_accessible :cess1, :cess2, :financialyear, :salaryrange, :surcharge, :taxrate




def self.search(search)
if search
    if search.is_a?(String)
       where('financialyear LIKE ? or salaryrange LIKE ? or taxrate LIKE ?', "%#{search}%" , "%#{search}%" , "%#{search}%")
    end
   else
       scoped
   end
end

end
