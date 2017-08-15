#
# Be sure to run `pod lib lint SwiftUIDebugSwiftyBeaver.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftUIDebugSwiftyBeaver'
  s.version          = '1.0.0'
  s.summary          = 'A swifty beaver target for the SwiftUIDebug view controller'

  s.description      = <<-DESC
A simple to use swifty beaver extension, for the SwiftUIDebug log view controller.
                       DESC

  s.homepage         = 'https://github.com/EMart86/SwiftUIDebugSwiftyBeaver'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Martin Eberl' => 'eberl_ma@gmx.at' }
  s.source           = { :git => 'https://github.com/EMart86/SwiftUIDebugSwiftyBeaver.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'SwiftUIDebugSwiftyBeaver/Classes/**/*'

  s.dependency 'SwiftUIDebug'
  s.dependency 'SwiftyBeaver'
end
