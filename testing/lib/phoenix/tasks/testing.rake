namespace :phoenix do
  namespace :testing do
    desc "Generates a dummy app for testing"
    task :dummy_app => [:setup_dummy_app]

    task :setup_dummy_app do
      require 'phoenix'

      params = %w(--quiet)

      Phoenix::DummyGenerator.start params

      # Load generated dummy app after generation - some of the follow
      # generators depend on Rails.root being available
      # load File.join(ENGINE_PATH, 'spec/dummy/config/environment.rb')
    end

    desc "Remove the dummy app used for testing"
    task :clean_dummy_app do
      Phoenix::Testing::Railtie.target_engine_path.join('spec', 'dummy').rmtree
    end
  end
end
