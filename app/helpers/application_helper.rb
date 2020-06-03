module ApplicationHelper
  def bootstrap_class_for flash_type, screen = :user
    case flash_type
    when "success"
      "alert-success"
    when "error"
      "alert-error"
    when "alert"
      screen == :user ? "alert-danger" : "alert-danger-ad"
    when "notice"
      "alert-info"
    else
      flash_type.to_s
    end
  end
end
