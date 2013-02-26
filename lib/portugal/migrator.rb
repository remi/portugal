module Portugal
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
end
