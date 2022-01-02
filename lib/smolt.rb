# frozen_string_literal: true

require_relative "smolt/version"

# Service to check the dependencies from the formula you want to install by homebrew
module Smolt
  def self.dependency(brew, opt: nil)
    if opt
      options = opt.split
      opt_diff = options.any?(/-*d*/)
    end
    installed_brews = `brew list`.split("\n")
    dependent_brews = `brew deps #{brew}`.split("\n")
    diff_brews = dependent_brews - installed_brews
    divider = "-" * 50
    formatted_installed = "#{divider}\nInstalled brews\n#{divider}\n#{installed_brews}\n"
    formatted_diff = "#{divider}\nAdditional brews\n#{divider}\n#{diff_brews}"
    formatted_full = "#{formatted_installed}\n#{formatted_diff}"

    return "#{brew} is already installed." unless installed_brews.grep(/#{brew}/).empty?

    return puts formatted_diff if opt_diff

    puts formatted_full
  end
end
