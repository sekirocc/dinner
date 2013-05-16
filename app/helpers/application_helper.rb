module ApplicationHelper

  def large_avatar(user)
    image_tag user.avatar.url(:large), :class => :large_avatar, :alt => "#{user.nickname} large avatar"
  end

  def medium_avatar(user)
    image_tag user.avatar.url(:medium), :class => :medium_avatar, :alt => "#{user.nickname} medium avatar"
  end

  def thumb_avatar(user)
    image_tag user.avatar.url(:thumb), :class => :thumb_avatar, :alt => "#{user.nickname} thumb avatar"
  end
  

end
