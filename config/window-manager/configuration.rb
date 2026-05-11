require 'yaml'

class Configuration
  WorkspaceConfiguration = Data.define(:profile, :workspace, :layout, :applications) do
    def matches?(profile, workspace)
      self.profile == profile && self.workspace == workspace
    end
  end

  DisplayConfiguration = Data.define(:name, :external, :menu_bar_height, :dock_height) do
    def profile
      external ? 'Split' : 'Full'
    end

    def matches?(name)
      self.name == name
    end
  end

  class << self
    def margin
      config['margin']
    end

    def displays
      @displays ||= config['displays'].map { DisplayConfiguration.new(**_1) }
    end

    def find_display(name)
      display_config = displays.find { _1.matches?(name) }

      unless display_config
        raise "No configuration found for display with name #{name.inspect}"
      end

      display_config
    end

    def workspaces
      @workspaces ||= config['workspaces'].map { WorkspaceConfiguration.new(**_1) }
    end

    def find_workspace(profile, workspace)
      workspace_config = workspaces.find { _1.matches?(profile, workspace) }

      unless workspace_config
        raise "No configuration found for workspace '#{workspace}' and profile '#{profile}'"
      end

      workspace_config
    end

    private

    def config
      @config ||= YAML.load_file(File.join(__dir__, 'configuration.yml'))
    end
  end
end
