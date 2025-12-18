require 'yaml'
class ConfigurationManager
  attr_accessor :config

  def initialize
    puts "Starting Configuration Manager..."
    file_name = input_file_name

    begin
      puts "Trying to open #{file_name}..."
      @config = YAML.load_file(file_name)
      puts "#{file_name} loaded successfully."
    rescue Errno::ENOENT
      puts "#{file_name} file not found !!!"
      puts "Creating the Default files..."
      self.class.create_default_config_file(file_name)
      @config = YAML.load_file(file_name)
    end
  end

  def self.create_default_config_file(file_name)
    puts "Enter default configuration values."
    print "Enter application name:"
    name = gets.chomp
    print "Enter environment (e.g., development/production): "
    env = gets.chomp
    print "Enter log level (e.g., info/debug/error): "
    log_level = gets.chomp

    default_config = {
      "app_name" => name,
      "environment" => env,
      "log_level" => log_level
    }
    File.open(file_name, "w+") do |file|
      file.write(default_config.to_yaml)
    end
    puts "Default configuration file created as #{file_name}."
  end

  private

  def input_file_name
    loop do
      puts "Enter configuration file name (e.g., config.yml):"
      file_name = gets.chomp
      if file_name.empty?
        puts "File name cannot be empty. Please try again."
      else
        return file_name
      end
    end
  end
end

ConfigurationManager.new