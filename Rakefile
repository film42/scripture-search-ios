# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'motion-testflight'
require 'bundler'
Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name       = 'ScripSearch'
  app.icons      = ['Icon.png', 'Icon@2x.png']
  app.version    = '1.0'
  app.identifier = 'com.crdev.scripture_search'

  app.testflight.sdk = 'vendor/TestFlight'
  app.testflight.api_token = '7bbbdd9c526302086c54d894245e8d06_ODU1NDMxMjAxMy0wMS0zMCAxODo0MTo0MC43MTU5MDc'
  app.testflight.team_token = 'c8295e143ec95aa1d3a37acbfa8fc817_MjM3MjE2MjAxMy0wNi0xNiAyMzozNDo1Ny45MjY2MjI'
end
