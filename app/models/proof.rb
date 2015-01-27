class Proof < ActiveRecord::Base
  attr_accessible :empid, :empname, :prooftype, :senddate, :attach, :status, :comment

validates_presence_of :empid, :message => "Emp Id cannot be blank"
validates_presence_of :empname, :message => "Employee's name cannot be blank"
validates_presence_of :prooftype, :message => "Proof ype cannot be blank"
validates_attachment_presence :attach, :message => "Attached file cannot be empty" 
belongs_to :employee

has_attached_file :attach


def self.search(search)
if search
    if search.is_a?(String)
       where('empid LIKE ? or empname LIKE ? or senddate LIKE ? or prooftype LIKE ?', "%#{search}%" , "%#{search}%" , "%#{search}%", "%#{search}%")
    end
   else
       scoped
   end
end


end
