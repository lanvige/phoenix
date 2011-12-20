namespace :phoenix do
  namespace :testing do
    desc "Generates a dummy app for testing"
    task :dummy_app => [:setup_dummy_app, :migrate_dummy_app]

    task :setup_dummy_app do
      require 'phoenix'

      params = %w(--quiet)

      Phoenix::DummyGenerator.start params

      # Load generated dummy app after generation - some of the follow
      # generators depend on Rails.root being available
      # load File.join(ENGINE_PATH, 'spec/dummy/config/environment.rb')
    end

    task :migrate_dummy_app do
      engines = %w(
        phoenix_core
        phoenix_settings
      )

      task_params = [%Q{ bundle exec rake -f #{Phoenix::Testing::Railtie.target_engine_path.join('Rakefile')} }]
      task_params << %Q{ app:railties:install:migrations FROM="#{engines.join(', ')}" }
      task_params << %Q{ app:db:drop app:db:create app:db:migrate app:db:seed app:db:test:prepare }
      task_params << %Q{ RAILS_ENV=development --quiet }

      system task_params.join(' ')
    end

    desc "Remove the dummy app used for testing"
    task :clean_dummy_app do
      Phoenix::Testing::Railtie.target_engine_path.join('spec', 'dummy').rmtree
    end

    namespace :engine do
      desc "Initialize the testing environment"
      task :setup => [:init_test_database]

      task :init_test_database => [
        'app:db:migrate',
        'app:db:test:prepare'
      ]
    end
  end
end
