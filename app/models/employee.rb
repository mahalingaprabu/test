#require 'role_access'
class Employee < ActiveRecord::Base
#include RoleAccess
  attr_accessible :address, :age, :depid, :designation, :dob, :doj, :email, :empid, :empname, :gender, :managerid, :mobno, :panno, :pic

attr_accessible :roles





#validate :dates_cannot_be_in_the_future


validates_presence_of :address#, :message => "Address cannot be blank"
#validates_presence_of :age, :message => "Unable to calculate employee's age at joining; please enter employee dob correctly.."
validates_presence_of :depid#, :message => "Departmentid cannot be blank"

validates_presence_of :designation#, :message => "Employee's designation cannot be blank"

validates_presence_of :dob#, :message => "Employee's date of birth cannot be blank"
validates_presence_of :doj#, :message => "Employee's date of joining cannot be blank"
validates_presence_of :email#, :message => "Email Id cannot be blank"
validates_presence_of :empid#, :message => "Emp Id cannot be blank"
validates_presence_of :empname#, :message => "Employee's name cannot be blank"
validates_presence_of :gender#, :message => "Gender cannot be blank"
validates_presence_of :managerid#, :message => "Employee's manager id cannot be blank"
validates_presence_of :mobno#, :message => "Employee's mobile number cannot be blank"
validates_presence_of :panno#, :message => "Employee's PAN number cannot be blank"
#validates_presence_of :roles, :message => "Employee role cannot be blank"

#validates_uniqueness_of :empid, :message => "Employee id has to be unique, this empid already exists!"
#validates_uniqueness_of :mobno, :message => "Employee mobile no has to be unique"
#validates_uniqueness_of :panno, :message => "Employee PAN NO has to be unique"
#validates_uniqueness_of :email, :message => "Employee's Email id should be unique"




validates_length_of :mobno, :is => 10#, :message => "Mobile number entry should contain 10 digits"

validates_numericality_of :age#, :only_integer => true, :greater_than_or_equal_to => 18, :message => "Employee should be greater than 18 years of age"
#validates_numericality_of :empid, :only_integer => true,:greater_than_or_equal_to => 0, :message => "Please enter a positive integer for emp id"
#validates_numericality_of :managerid, :only_integer => true,:greater_than_or_equal_to => 0, :message => "Please enter a positive integer for manager emp id"
validates_numericality_of :mobno#, :only_integer => true, :greater_than_or_equal_to => 0, :message => "Please enter a valid numerical value for employee's mobile no"

validates_format_of :email,
                      :with => /^([^@\s]+)@((?:[-a-zA-Z0-9]+\.)+[a-zA-Z]{2,})$/#,                      :message => 'Employee\'s email id must have a valid formt, e.g. a@b.com'



has_one :user
has_many :proof
accepts_nested_attributes_for :proof
has_many :salary_structure
has_many :salary_details
has_many :complaints
has_attached_file :pic

belongs_to :department


def dates_cannot_be_in_the_future
       errors.add(:doj,"Joining date cannot be in the future") if 
       (!doj.blank? and doj > Date.today) 
       errors.add(:dob,"Date of birth cannot be in the future") if
       (!dob.blank? and dob > Date.today)
end

def self.search(search)
if search
    if search.is_a?(String)
       where('empid LIKE ? or empname LIKE ? or mobno LIKE ? or designation LIKE ?', "%#{search}%" , "%#{search}%" , "%#{search}%", "%#{search}%")
    end
   else
       scoped
   end
end



end
