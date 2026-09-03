# frozen_string_literal: true

require 'json'

module Space
  class << self
    def native_fullscreen?
      JSON.parse(`yabai -m query --spaces --space`)['is-native-fullscreen']
    end
  end
end
