

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "SQStarRatedView"
  s.version      = "1.1.0"
  s.summary      = "用来评星星."
  s.description  = <<-DESC
用来评星星的，支持开/关动画、支持开／关非整星显示，支持手势
                   DESC

  s.homepage     = "https://github.com/SQsteven/SQStarRatedView"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "严顺泉" => "782569375@qq.com" }
  # Or just: s.author    = "严顺泉"
  # s.authors            = { "严顺泉" => "782569375@qq.com" }
   s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/SQsteven/SQStarRatedView", :tag => '1.1.0' }
  s.source_files  = "SQStarRatedView/*.{h,m}"
  # s.public_header_files = "Classes/**/*.h"
  # s.resource  = "icon.png"
  s.resources = "SQStarRatedView/Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"
  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"
  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
