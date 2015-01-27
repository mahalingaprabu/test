# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

User.create(:login => "0001", :hashed_password => "702a505852d783a16d18cde14c331b2bfd1e804f", :salt => "25eE2ToEsG", :email => 'agentstream.agenta@gmail.com', :employee_id => 1)

User.create(:login => "0002", :hashed_password => "b6c6b6ee472ea822fd68f37e00270461b01a519c", :salt => "EKVtyTtXAC", :email => 'agentstream.tnss@gmail.com', :employee_id => 2)




Employee.create(:empname => "Saravana", :address => "RAPIDTHINK Chennai", :gender => "Male", :dob => '1980-01-21', :doj => '2001-01-30', :age => 45, :empid => "0001", :designation => 'Managing Director', :managerid => "0002", :mobno => 9876543212, :panno => 'AZAZAZAZAM', :email => 'agentstream12.tnss@gmail.com', :depid =>'2001', :roles => "Admin")

Employee.create(:empname => "Vasudevan", :address => "RAPIDTHINK Chennai", :gender => "Male", :dob => '1980-01-01', :doj => '2001-01-01', :age => 45, :empid => "0002", :designation => 'Managing Director', :managerid => "0001", :mobno => 9876543211, :panno => 'AZAZAZAZAZ', :email=> 'agentstream.tnss@gmail.com', :depid =>'2000', :roles => "Admin" )


