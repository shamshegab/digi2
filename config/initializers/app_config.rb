class AppConfig
    def self.load
      config_file = File.join(Rails.root, 'config', 'app_config.yml')
  
      if File.exist?(config_file)
        config = YAML.safe_load(ERB.new(File.read(config_file)).result, [], [], true)['default'].merge(YAML.safe_load(ERB.new(File.read(config_file)).result, [], [], true)[::Rails.env])
        config.keys.each do |key|
          cattr_accessor key
          send("#{key}=", config[key])
        end
      end
    end
  
    def self.method_missing(*_args)
      nil
    end
  end
  AppConfig.load