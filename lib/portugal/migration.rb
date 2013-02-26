module Portugal
  class Migration
    attr_reader :filename

    def initialize(name)
      @filename = File.join(Portugal.config.migrations_path, "#{"%03d" % Migration.next_migration_number}_#{name.underscore}.rb")
      content = Migration.generate_content(binding)

      File.open(@filename, 'w+') { |data| data << content }
    end

    def self.generate_content(binding)
      @template ||= ERB.new(File.read(File.expand_path("../templates/new_migration.rb", __FILE__)))
      @template.result(binding)
    end

    def self.next_migration_number
      migration_number = Dir[File.join(Portugal.config.migrations_path, '*.rb')].inject(1) do |memo, item|
        filename = File.basename(item, File.extname(item))
        number = filename.gsub(/\A(\d+)_.*\Z/, '\1').to_i + 1
        number > memo ? number : memo
      end
    end
  end
end
