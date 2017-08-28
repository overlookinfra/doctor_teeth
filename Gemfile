# frozen_string_literal: true

source 'https://rubygems.org'
require 'rubygems'
# place all development, system_test, etc dependencies here

def location_for(place, fake_version = nil)
  if place =~ /^(git:[^#]*)#(.*)/
    [fake_version, { git: Regexp.last_match(1), branch: Regexp.last_match(2), require: false }].compact
  elsif place =~ /^file:\/\/(.*)/
    ['>= 0', { path: File.expand_path(Regexp.last_match(1)), require: false }]
  else
    [place, { require: false }]
  end
end

# unit tests: --without system_tests development
gem 'rake'
gem 'rspec'

group :system_tests do
end

group :development do
  gem 'bundler' # bundler rake tasks
  gem 'rubocop', '~> 0.49.1', require: false # used in tests. pinned
  # Documentation dependencies
  gem 'markdown', '~> 0'
  gem 'yard', '~> 0'
end

local_gemfile = "#{__FILE__}.local"
eval(File.read(local_gemfile), binding) if File.exist? local_gemfile

user_gemfile = File.join(Dir.home, '.Gemfile')
eval(File.read(user_gemfile), binding) if File.exist? user_gemfile
