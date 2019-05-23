lib = File.expand_path(".", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'active_support/all'
require "ostruct"
require "doodads/registry"

module  Doodads
  extend Registry

  autoload(:DSL, "doodads/dsl")

  def self.config
    @config ||= Config.new(css_strategy: :maintainable_css, link_class: "link", link_modifier: "has-link")
    yield @config if block_given?
    @config
  end

  private

  class Config < OpenStruct
  end
end
