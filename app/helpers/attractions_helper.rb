module AttractionsHelper
  def new_attraction(user)
    link_to( "New Attraction", new_attraction_path) if user.admin
  end

  def show_or_go(user, attraction)
    string = user.admin ? 'Show' : 'Go on'
    link_to "#{string} #{attraction.name}", attraction_path(attraction)
  end
end
