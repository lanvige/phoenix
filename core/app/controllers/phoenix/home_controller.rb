module Phoenix
  class HomeController < BaseController

    layout "/phoenix/layouts/application"
    
    def index
      #RubyProf.start
      "hello world!"
      #results = RubyProf.stop
      
      #File.open "/home/lanvige/repos/profile-index.html", 'a' do |file|
      #  RubyProf::GraphHtmlPrinter.new(results).print(file)
      #end
    end
  end
end