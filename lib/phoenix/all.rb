%w(core testing).each do |engine|
  require "phoenix_#{engine}"
end
