%w(core auth social).each do |engine|
  require "phoenix_#{engine}"
end
