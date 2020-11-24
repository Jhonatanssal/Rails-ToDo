module ApplicationHelper
  def logout
    if current_user
      link_to 'Logout', destroy_user_session_path, method: :delete, class: 'btn btn-warning'
    end
  end
end
