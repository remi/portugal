require "portugal/version"

module Portugal
  def self.configure(&blk)
    @config = OpenStruct.new
    blk.yield(@config)
  end

  def self.config
    @config
  end

  class Migrator
    def self.migrate!
      ActiveRecord::Migration.verbose = true
      ActiveRecord::Migrator.migrate(Portugal.config.migrations_path)
    end

    def self.rollback!(step)
      ActiveRecord::Migration.verbose = true
      ActiveRecord::Migrator.rollback(Portugal.config.migrations_path, step)
    end
  end

  class Migration
    def initialize(name)
      migration_number = Dir[File.join(Portugal.config.migrations_path, '*.rb')].inject(0) do |memo, item|
        filename = File.basename(item, File.extname(item))
        number = filename.gsub(/\A(\d+)_.*\Z/, '\1').to_i + 1
        number > memo ? number : memo
      end

      content = <<CONTENT
class #{name.camelize} < ActiveRecord::Migration
  def up
  end

  def down
  end

  # def change
  # end
end
CONTENT

      migration_file = File.join(Portugal.config.migrations_path, "#{"%03d" % migration_number}_#{name.underscore}.rb")
      File.open(migration_file, 'w+') { |data| data << content }

      puts migration_file
    end
  end
end
