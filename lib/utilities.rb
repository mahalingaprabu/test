module Utilities

def get_date_from_hash(hash,date_sym_or_str)
   attribute=date_sym_or_str.to_s
   return Date.new(hash[attribute + '(1i)'].to_i, hash[attribute + '(2i)'].to_i, hash[attribute + '(3i)'].to_i).strftime("%d-%m-%Y")
end

end
