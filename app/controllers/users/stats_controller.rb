class Users::StatsController < Users::ManagementController
  def show
    set_secondary_navigation_tab("overview")
    @episodes = Current.user.episodes
  end
  def downloads
    set_secondary_navigation_tab("downloads")
  end

  def technologies
    set_secondary_navigation_tab("technologies")
  end

  def locations
    set_secondary_navigation_tab("locations")
  end

  def achievements
    set_secondary_navigation_tab("achievements")
  end
end
