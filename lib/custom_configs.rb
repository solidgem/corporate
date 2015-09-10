module CustomConfigs
  def self.by_type(type)
    @default_formulas_conf ||= ::YAML.load(File.read("config/default_params_for_formulas.yaml"))
    @default_formulas_conf[type]
  end
end