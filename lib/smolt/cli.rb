# frozen_string_literal: true

require "smolt"
require "smolt/version"
require "thor"
require "uri"
require "net/http"
require "json"
require "byebug"

module Smolt
  # Smolt's all methods
  class CLI < Thor
    desc "version", "show smolt version"
    def version
      puts "smolt #{VERSION}"
    end

    desc "diff deps", "return differencies of dependencies"
    def diff(formula)
      puts brew_deps(formula)
    end

    private

    def brew_deps(formula)
      installed = brew_list
      deps_array = fetch_deps(formula)
      deps = []
      begin
        deps_array.each { |f| deps << f unless installed.include?(f) }
        if deps.empty?
          "#{formula} does not require any additional dependencies."
        else
          ":::Differencies of dependencies:::\n#{deps}"
        end
      rescue NoMethodError
        "#{formula} is not found."
      end
    end

    def fetch_deps(formula)
      uri = URI("https://formulae.brew.sh/api/formula/#{formula}.json")
      res = Net::HTTP.get_response(uri)
      JSON.parse(res.body)["dependencies"] if res.is_a?(Net::HTTPSuccess)
    end

    def brew_list
      `brew list`.split("\n")
    end
  end
end
