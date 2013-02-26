require "portugal/version"

module Portugal
  def self.configure(&blk)
    @config = OpenStruct.new
    blk.yield(@config)
  end

  def self.config
    @config
  end
end
