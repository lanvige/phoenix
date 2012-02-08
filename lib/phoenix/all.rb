%w(core authentication).each do |engine|
  require "phoenix_#{engine}"
end
