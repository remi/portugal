module Portugal
  class Migrator
    def self.migrate!
      ActiveRecord::Migration.verbose = Portugal.config.verbose
      ActiveRecord::Migrator.migrate Portugal.config.migrations_path
    end

    def self.rollback!(step)
      ActiveRecord::Migration.verbose = Portugal.config.verbose
      ActiveRecord::Migrator.rollback Portugal.config.migrations_path, step
    end
  end
end
