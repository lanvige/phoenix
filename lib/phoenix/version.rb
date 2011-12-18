version = File.read(File.expand_path("../../../PHOENIX_VERSION", __FILE__)).strip

module Phoenix
  def self.version
    # Why can't use version from file
    "0.2.0.beta"
  end
end
