Pod::Spec.new do |s|
  s.name         = "Weibo_SDK"
  s.homepage     = "https://github.com/sinaweibosdk/weibo_ios_sdk"
  s.summary      = "WeiboSDK on iOS."
  s.description  = <<-DESC
                   New weibosdk pod.
                   DESC
  s.author       = { "xingda" => "xingda@staff.weibo.com" }
  s.version      = "3.4.0"
  s.source       = { :git => "https://github.com/sinaweibosdk/weibo_ios_sdk.git", :tag => "3.4.0" }
  s.platform     = :ios, '12.0'
  s.requires_arc = false
  s.license      = 'MIT'
  s.source_files = 'libWeiboSDK/*.{h,m}'
  s.resource     = 'libWeiboSDK/WeiboSDK.bundle'
  s.resource_bundles = {'libWeiboSDK'=>['libWeiboSDK/PrivacyInfo.xcprivacy']}
  s.preserve_paths = "libWeiboSDK/libWeiboSDK.a"

  s.frameworks   = 'Photos', 'ImageIO', 'SystemConfiguration', 'CoreText', 'QuartzCore', 'Security', 'UIKit', 'Foundation', 'CoreGraphics','CoreTelephony','WebKit'
  s.libraries = 'sqlite3', 'z'

  s.pod_target_xcconfig = {
    # 告诉链接器静态库的路径（关键！否则会找不到libWeiboSDK.a）
    "LIBRARY_SEARCH_PATHS" => "$(inherited) $(SRCROOT)/libWeiboSDK",
    
    # 真机环境：添加链接参数
    "OTHER_LDFLAGS[sdk=iphoneos*]" => "$(inherited) -lWeiboSDK",
    
    # 模拟器环境：不添加链接参数
    "OTHER_LDFLAGS[sdk=iphonesimulator*]" => "$(inherited)",
  }
end
