#
# Be sure to run `pod lib lint ReusableViewExtensions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ReusableViewExtensions'
  s.version          = '0.1.0'
  s.summary          = 'Helper methods for UITableView and UICollectionView reusable views'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Set of extensions for UITableView and UICollectionView for handling cells reusability. Hides casting and eliminates finding cells by Strings.
                       DESC

  s.homepage         = 'https://github.com/agruchala/ReusableViewExtensions'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Artur Gruchała' => 'gruchala.a@gmail.com' }
  s.source           = { :git => 'https://github.com/agruchala/ReusableViewExtensions.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'ReusableViewExtensions/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ReusableViewExtensions' => ['ReusableViewExtensions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.swift_version = '4.0'
end
