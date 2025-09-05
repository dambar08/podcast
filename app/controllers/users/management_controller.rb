class Users::ManagementController < ApplicationController
  layout "users/application"


  def set_current_tab(current_tab = "overview")
    @tab = current_tab
  end

  def set_secondary_navigation_tab(current_tab = "overview")
    @secondary_navigation_tab = current_tab
  end
end
