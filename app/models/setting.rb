class Setting < RailsSettings::Base

  scope :application do
    field :block_order, default: false
    field :block_ordering, default: false
    field :now_is_blocking_ordering_you_are_late default: "你来晚了一步，现在已经不能点餐了。点餐时间是上午 9:30 ～ 10:30, 下午 2:30 ~ 4:30，下次要早点哦！"
  end

  def self.toggle_block_ordering!
    Setting.block_ordering = !Setting.block_ordering
  end

end
