class Setting < ActiveRecord::Base
  attr_accessible :name, :value

  @@available_settings = YAML::load(File.open("#{Rails.root}/config/settings.yml"))

  
end
