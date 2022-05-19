require_relative '../smolt'
require 'thor'

module Smolt
  class CLI < Thor
    desc 'full Brew', 'show full dependencies'
    def full(brew)
      installed_brews = `brew list`.split("\n")
      dependent_brews = `brew deps #{brew}`.split("\n")
      diff_brews = dependent_brews - installed_brews
      divider = "-" * 50
      formatted_installed = "#{divider}\nInstalled brews\n#{divider}\n#{installed_brews}\n"
      formatted_diff = "#{divider}\nAdditional brews\n#{divider}\n#{diff_brews}"
      formatted_full = "#{formatted_installed}\n#{formatted_diff}"

      return "#{brew} is already installed." unless installed_brews.grep(/#{brew}/).empty?

      puts formatted_full
    end

    desc 'diff Brew', 'show differencies of dependencies'
    def diff(brew)
      installed_brews = `brew list`.split("\n")
      dependent_brews = `brew deps #{brew}`.split("\n")
      diff_brews = dependent_brews - installed_brews
      divider = "-" * 50
      formatted_diff = "#{divider}\nAdditional brews\n#{divider}\n#{diff_brews}"

      return "#{brew} is already installed." unless installed_brews.grep(/#{brew}/).empty?

      puts formatted_diff
    end
  end
end
