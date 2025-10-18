require 'yaml'

class Configuration
  Workspace = Data.define(:profile, :workspace, :layout, :applications) do
    def matches?(profile, workspace)
      self.profile == profile && self.workspace == workspace
    end
  end

  class << self
    def margin
      config['margin']
    end

    def workspaces
      @workspaces ||= config['workspaces'].map do |ws|
        Workspace.new(**ws.transform_keys(&:to_sym))
      end
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
