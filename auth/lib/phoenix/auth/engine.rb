module Phoenix
	module Auth
	  class Engine < Rails::Engine
	    isolate_namespace PhoenixAuth
	  end
	end
end
