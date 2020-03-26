module UsersHelper

 def loggin_or_profile(user_id)
  if user_id
    user = User.find_by_id(user_id)
    link_to( user_or_admin(user), user_path(user), class: 'navbar-brand') + link_to( 'Log Out', logout_path, method: :post, class: 'navbar-brand')
  else
    link_to( "Sign Up", new_user_path, class:'navbar-brand') + link_to( "Log in", signin_path, class:'navbar-brand')
  end
 end

  def user_or_admin(user)
    if user.admin
      'ADMIN'
    else
      "#{user.name}'s profile"
    end
  end
end
