
# rake phoenix:version -v 1.0.0.rc1

root = File.expand_path('../../', __FILE__)


namespace :phoenix do
	desc "upgrade the phoenix version"
	task :version, :new_version do |t, args|
		puts t.name
		puts args.inspect
	end
end