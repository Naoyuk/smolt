# frozen_string_literal: true

require "./lib/smolt/version"
require "./lib/smolt/cli"

# Service to check the dependencies from the formula you want to install by homebrew
module Smolt
  class Error < StandardError; end
end
