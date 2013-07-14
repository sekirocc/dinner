class Setting < RailsSettings::CachedSettings
	attr_accessible :var

  def self.toggle_block_ordering!
    Setting.block_ordering = !Setting.block_ordering
  end

end
