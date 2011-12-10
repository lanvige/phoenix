version = File.read(File.expand_path("../../../PHOENIX_VERSION", __FILE__)).strip

module Phoenix
  def self.version
    # Why can't use version from file
    #version
    "0.0.2.beta"
  end
end
