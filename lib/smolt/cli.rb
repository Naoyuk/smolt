# frozen_string_literal: true

require "./lib/smolt"
require "./lib/smolt/version"
require "thor"

module Smolt
  # Smolt's all methods
  class CLI < Thor
    desc "version", "show smolt version"
    def version
      puts "smolt #{VERSION}"
    end

    desc "full Brew", "show full dependencies"
    def full(brew)
      brew_params(brew)
      @installed_brews.grep(/#{brew}/)
      return puts "#{brew} is already installed." unless @installed_brews.grep(/#{brew}/).empty?

      puts @formatted_full
    end

    desc "diff Brew", "show differencies of dependencies"
    def diff(brew)
      brew_params(brew)
      return puts "#{brew} is already installed." unless @installed_brews.grep(/#{brew}/).empty?

      puts @formatted_diff
    end

    private

    def brew_params(brew)
      @brew = brew
      @installed_brews = `brew list`.split("\n")
      dependent_brews = `brew deps #{@brew}`.split("\n")
      diff_brews = dependent_brews - @installed_brews
      divider = "-" * 50
      formatted_installed = "#{divider}\nInstalled brews\n#{divider}\n#{@installed_brews}\n"
      @formatted_diff = "#{divider}\nAdditional brews\n#{divider}\n#{diff_brews}"
      @formatted_full = "#{formatted_installed}\n#{@formatted_diff}"
    end
  end
end
