%w(core auth testing).each do |engine|
  require "phoenix_#{engine}"
end
