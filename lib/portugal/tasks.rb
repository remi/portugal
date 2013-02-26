require 'portugal'

namespace :db do
  desc "Migrate the database"
  task :migrate => :environment do
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate(Portugal.config.migrations_path)
  end

  desc "Rolls the database back to the previous version (specify steps w/ STEP=n)."
  task :rollback => :environment do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.rollback(Portugal.config.migrations_path, step)
  end

  desc "Create a new migration file (specify name w/ NAME=do_something)"
  task :new_migration => :environment do
    migration_name = ENV["NAME"]

    migration_number = Dir[File.join(Portugal.config.migrations_path, '*.rb')].inject(0) do |memo, item|
      filename = File.basename(item, File.extname(item))
      number = filename.gsub(/\A(\d+)_.*\Z/, '\1').to_i + 1
      number > memo ? number : memo
    end

    content = <<CONTENT
class #{migration_name.camelize} < ActiveRecord::Migration
  def up
  end

  def down
  end

  # def change
  # end
end
CONTENT

    migration_file = File.join(Portugal.config.migrations_path, "#{"%03d" % migration_number}_#{migration_name.underscore}.rb")
    File.open(migration_file, 'w+') { |data| data << content }

    puts migration_file
  end
end

