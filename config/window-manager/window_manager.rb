require_relative 'window'
require_relative 'screen'
require_relative 'configuration'
require_relative 'layout'

module WindowManager
  class << self
    def arrange(profile, workspace)
      # Get the workspace configuration
      config = Configuration.find_workspace(profile, workspace)

      # Get all visible windows, filter them to only those in the workspace configuration and sort
      # them by their order in the configuration
      windows = Window
        .visible
        .filter { config.applications.include?(_1.application) }
        .sort_by { config.applications.index(_1.application) || config.applications.length }

      # Calculate the layout rectangles
      rectangles = Layout.calculate(config.layout, Screen.visible_rectangle, windows.length)

      # Apply the layout to each window
      windows.zip(rectangles).each do |window, rectangle|
        window.update_position(rectangle)
      end
    end
  end
end
