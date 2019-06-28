#
# Be sure to run `pod lib lint IrnLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |irnlibspec|
  irnlibspec.name             = 'IrnLib'
  irnlibspec.version          = '0.1.0'
  irnlibspec.summary          = 'A short description of IrnLib.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  irnlibspec.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  irnlibspec.homepage         = 'https://github.com/uhutu/IrnLib'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  irnlibspec.license          = { :type => 'MIT', :file => 'LICENSE' }
  irnlibspec.author           = { 'liudongpu' => 'liudongpu@hotmail.com' }
  irnlibspec.source           = { :git => 'https://github.com/uhutu/IrnLib.git', :tag => irnlibspec.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  irnlibspec.ios.deployment_target = '9.0'

  irnlibspec.source_files = 'IrnLib/Classes/**/*'
  
  # s.resource_bundles = {
  #   'IrnLib' => ['IrnLib/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'



  require "json"

  #package = JSON.parse(File.read(File.join(__dir__, "package.json")))
  version = "0.59.9"
  folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1'
  folly_version = '2018.10.22.00'

  irnlibspec.default_subspec         = "Core"
  irnlibspec.requires_arc            = true
  irnlibspec.pod_target_xcconfig     = { "CLANG_CXX_LANGUAGE_STANDARD" => "c++14" }
  irnlibspec.preserve_paths          = "package.json", "LICENSE", "LICENSE-docs"
  irnlibspec.cocoapods_version       = ">= 1.2.0"

  irnlibspec.subspec "Core" do |ss|
    #ss.dependency             "yoga", "#{package["version"]}.React"
    ss.source_files         = "React/**/*.{c,h,m,mm,S,cpp}"
    ss.exclude_files        = "**/__tests__/*",
                              "IntegrationTests/*",
                              "React/DevSupport/*",
                              "React/Inspector/*",
                              "ReactCommon/yoga/*",
                              "React/Cxx*/*",
                              "React/Fabric/**/*"
    ss.ios.exclude_files    = "React/**/RCTTV*.*"
    ss.tvos.exclude_files   = "React/Modules/RCTClipboard*",
                              "React/Views/RCTDatePicker*",
                              "React/Views/RCTPicker*",
                              "React/Views/RCTRefreshControl*",
                              "React/Views/RCTSlider*",
                              "React/Views/RCTSwitch*",
                              "React/Views/RCTWebView*"
    ss.compiler_flags       = folly_compiler_flags
    ss.header_dir           = "React"
    ss.framework            = "JavaScriptCore"
    ss.libraries            = "stdc++"
    ss.pod_target_xcconfig  = { "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\"" }
  end




  irnlibspec.subspec "yoga" do |spec|
    spec.requires_arc = false
    spec.compiler_flags = [
        '-fno-omit-frame-pointer',
        '-fexceptions',
        '-Wall',
        '-Werror',
        '-std=c++1y',
        '-fPIC'
    ]

    # Pinning to the same version as React.podspec.
    spec.platforms = { :ios => "9.0", :tvos => "9.2" }

    # Set this environment variable when *not* using the `:path` option to install the pod.
    # E.g. when publishing this spec to a spec repo.
    source_files = 'yoga/**/*.{cpp,h}'
    source_files = File.join('ReactCommon/yoga', source_files) if ENV['INSTALL_YOGA_WITHOUT_PATH_OPTION']
    spec.source_files = source_files

    header_files = 'yoga/{Yoga,YGEnums,YGMacros,YGValue}.h'
    header_files = File.join('ReactCommon/yoga', header_files) if ENV['INSTALL_YOGA_WITHOUT_PATH_OPTION']
    spec.public_header_files = header_files
  end


end
