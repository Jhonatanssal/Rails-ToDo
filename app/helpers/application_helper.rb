module ApplicationHelper
  def logout
    return link_to 'Logout', destroy_user_session_path, method: :delete, class: 'btn btn-warning' if current_user
  end
end
