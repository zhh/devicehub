# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  #错误信息
  def flash_errors(condition, attributes = {})
    if condition.nil?
      attributes["style"] = "display: none"
    end
    attrs = tag_options(attributes.stringify_keys)
    "<div #{attrs}>"
  end

  #其他信息
  def flash_notice(condition, attributes = {})
    if condition.nil?
      attributes["style"] = "display: none"
    end
    attrs = tag_options(attributes.stringify_keys)
    "<div #{attrs}>"
  end  

end
