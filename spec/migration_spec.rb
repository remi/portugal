require 'spec_helper'

describe Portugal::Migration do
  describe :initialize do
    let(:create_migration!) { Portugal::Migration.new("foo_bar") }

    context "without existing migrations" do
      before do
        File.should_receive(:open).with(File.join(Portugal.config.migrations_path, "001_foo_bar.rb"), 'w+')
      end

      it("creates the first migration file") { create_migration! }
    end

    context "with existing migrations" do
      before do
        Portugal::Migration.should_receive(:next_migration_number).and_return(2)
        File.should_receive(:open).with(File.join(Portugal.config.migrations_path, "002_foo_bar.rb"), 'w+')
      end

      it("creates a new file while incrementing the migraton number") { create_migration! }
    end
  end
end
