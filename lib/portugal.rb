require 'portugal/version'
require 'erb'
require 'ostruct'

require 'active_record'
require 'active_support/inflector'

require 'portugal/migrator'
require 'portugal/migration'

module Portugal
  def self.configure(&blk)
    @config = self.config
    blk.yield(@config)
  end

  def self.config
    @config || OpenStruct.new
  end
end
