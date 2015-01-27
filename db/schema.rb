# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140514072811) do

  create_table "complaints", :force => true do |t|
    t.string   "empid"
    t.string   "empname"
    t.string   "ctype"
    t.date     "cdate"
    t.text     "summary"
    t.text     "description"
    t.string   "assignto"
    t.string   "status"
    t.integer  "empid_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "comments"
  end

  create_table "deductions", :force => true do |t|
    t.string   "deduction_mode"
    t.string   "deduction_type"
    t.string   "financial_year"
    t.decimal  "max_amount",     :precision => 8, :scale => 3
    t.string   "section"
    t.decimal  "section_limit",  :precision => 8, :scale => 3
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "depid"
    t.string   "depname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "employees", :force => true do |t|
    t.string   "empid"
    t.string   "empname"
    t.date     "dob"
    t.integer  "age"
    t.string   "gender"
    t.date     "doj"
    t.string   "designation"
    t.string   "managerid"
    t.text     "address"
    t.integer  "mobno"
    t.string   "panno"
    t.string   "email"
    t.string   "depid"
    t.integer  "depid_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "roles"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "investments", :force => true do |t|
    t.string   "investid"
    t.string   "section"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "proofs", :force => true do |t|
    t.string   "empid"
    t.string   "empname"
    t.string   "prooftype"
    t.date     "senddate"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "attach_file_name"
    t.string   "attach_content_type"
    t.integer  "attach_file_size"
    t.datetime "attach_updated_at"
    t.string   "status"
    t.string   "comment"
  end

  create_table "salary_details", :force => true do |t|
    t.string   "empid"
    t.string   "empname"
    t.decimal  "basicpay",            :precision => 8,  :scale => 3
    t.decimal  "hra",                 :precision => 8,  :scale => 3
    t.decimal  "da",                  :precision => 8,  :scale => 3
    t.decimal  "ca",                  :precision => 8,  :scale => 3
    t.decimal  "sa",                  :precision => 8,  :scale => 3
    t.decimal  "medical",             :precision => 8,  :scale => 3
    t.decimal  "leavetransallowance", :precision => 8,  :scale => 3
    t.decimal  "bonus",               :precision => 8,  :scale => 3
    t.decimal  "gross_salary",        :precision => 8,  :scale => 3
    t.decimal  "salaryded",           :precision => 8,  :scale => 3
    t.decimal  "professionaltax",     :precision => 8,  :scale => 3
    t.decimal  "incometax",           :precision => 8,  :scale => 3
    t.decimal  "gross_ded",           :precision => 8,  :scale => 3
    t.decimal  "netsalary",           :precision => 8,  :scale => 3
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.integer  "dayspaid"
    t.integer  "daysinmonth"
    t.decimal  "esi",                 :precision => 10, :scale => 0
    t.date     "salarydate"
  end

  create_table "salary_structures", :force => true do |t|
    t.string   "empid"
    t.string   "empname"
    t.decimal  "basicpay",            :precision => 8,  :scale => 3
    t.decimal  "hra",                 :precision => 8,  :scale => 3
    t.decimal  "da",                  :precision => 8,  :scale => 3
    t.decimal  "ca",                  :precision => 8,  :scale => 3
    t.decimal  "sa",                  :precision => 8,  :scale => 3
    t.decimal  "medical",             :precision => 8,  :scale => 3
    t.decimal  "leavetransallowance", :precision => 8,  :scale => 3
    t.decimal  "bonus",               :precision => 8,  :scale => 3
    t.decimal  "gross_salary",        :precision => 8,  :scale => 3
    t.decimal  "salaryded",           :precision => 8,  :scale => 3
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.decimal  "esi",                 :precision => 10, :scale => 0
  end

  create_table "taxslabs", :force => true do |t|
    t.string   "financialyear"
    t.string   "salaryrange"
    t.decimal  "taxrate",       :precision => 10, :scale => 0
    t.decimal  "cess1",         :precision => 10, :scale => 0
    t.decimal  "cess2",         :precision => 10, :scale => 0
    t.decimal  "surcharge",     :precision => 10, :scale => 0
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "hashed_password"
    t.string   "email"
    t.string   "salt"
    t.datetime "created_at"
    t.integer  "employee_id"
  end

end
