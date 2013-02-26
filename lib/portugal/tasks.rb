require 'portugal'

namespace :db do
  desc "Migrate the database"
  task :migrate => :environment do
    Portugal::Migrator.migrate!
  end

  desc "Rolls the database back to the previous version (specify steps w/ STEP=n)."
  task :rollback => :environment do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    Portugal::Migrator.rollback!(step)
  end

  desc "Create a new migration file (specify name w/ NAME=do_something)"
  task :new_migration => :environment do
    migration = Portugal::Migration.new(ENV["NAME"])
    puts "Generated #{migration.filename}"
  end
end

