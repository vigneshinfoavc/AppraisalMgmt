module ApplicationHelper
  
  def error_messages_for(object)
    render(:partial => 'common/error_message', :locals => {:object => object})
  end
  
  def is_manager_or_admin?
    if (session[:role] == "Manager" || session[:role] == "Admin")
      true
    else
      false
    end
  end
  
  def link_enable?
    if (session[:role] == "Admin")
      true
    else
      false
    end
  end

  def is_manager?
    if session[:role] == "Manager"
      "Do Appraisal Feedback"
    else
      "Do Appraisal"
    end
  end
end
