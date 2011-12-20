%w(core auth social testing).each do |engine|
  require "phoenix_#{engine}"
end
