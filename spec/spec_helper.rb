require_relative '../app'

MethodsPracticeApp.environment = :test
Bundler.require :default, MethodsPracticeApp.environment

require_relative 'support/helpers/methods_practice_helpers_spec_helpers'