require 'spec_helper'

describe Portugal::Migrator do
  describe :migrate! do
    before { ActiveRecord::Migrator.should_receive(:migrate).with(Portugal.config.migrations_path) }
    it("calls ActiveRecord::Migrator.migrate") { Portugal::Migrator.migrate! }
  end

  describe :rollback! do
    before { ActiveRecord::Migrator.should_receive(:rollback).with(Portugal.config.migrations_path, 2) }
    it("calls ActiveRecord::Migrator.rollback") { Portugal::Migrator.rollback!(2) }
  end
end
