module Flashspace
  class << self
    def profile
      `flashspace get-profile`.strip
    end

    def workspace
      `flashspace get-workspace`.strip
    end
  end
end
