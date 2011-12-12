module Phoenix
  class HomeController < BaseController
    def index
      RubyProf.start
      "hello world!"
      results = RubyProf.stop
      
      File.open "/Users/lanvige/repos/profile-index.html", 'a' do |file|
        RubyProf::GraphHtmlPrinter.new(results).print(file)
      end
    end
  end
end