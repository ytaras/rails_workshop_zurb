module ApplicationHelper
  DEFAULT_KEY_MATCHING = {
    :alert     => :alert,
    :notice    => :success,
    :info      => :standard,
    :secondary => :secondary,
    :success   => :success,
    :error     => :alert
  }
  def display_flash_messages(key_matching = {})
    key_matching = DEFAULT_KEY_MATCHING.merge(key_matching)
    flash.inject "" do |message, (key, value)|
      message += content_tag :div, :data => { :alert => "" }, :class => "alert-box #{key_matching[key] || :standard}" do
        (value + link_to("&times;".html_safe, "#", :class => :close)).html_safe
      end
    end.html_safe
  end
end
