module Flashspace
  class << self
    def profile
      `flashspace get-profile`.strip
    end

    def workspace
      `flashspace get-workspace`.strip
    end

    def apps(workspace, profile)
      `flashspace list-apps #{workspace} --profile #{profile}`.strip.split("\n")
    end
  end
end
