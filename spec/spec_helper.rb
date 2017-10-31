# frozen_string_literal: true

def is_ci?
  ENV['CI'] || ENV['JENKINS_URL'] || ENV['TRAVIS'] || ENV['APPVEYOR']
end

unless ENV['COVERAGE'] && ENV['COVERAGE'].to_s.downcase != 'true' &&
    ENV['COVERAGE'].to_s.downcase != 'yes' &&
    ENV['COVERAGE'].to_s.downcase != 'on'

  # coveralls prevents local simplecov from running (facepalm)
  if is_ci?
    # https://coveralls.io/github/puppetlabs/doctor_teeth
    require 'coveralls'
    Coveralls.wear!
  end

  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
    add_filter '.bundle/gems'
  end
end

require 'rspec'
require 'doctor_teeth'

def random_string
  (0...10).map { ('a'..'z').to_a[rand(26)] }.join
end