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
  s.vendored_libraries  = 'libWeiboSDK/libWeiboSDK.a'
  s.frameworks   = 'Photos', 'ImageIO', 'SystemConfiguration', 'CoreText', 'QuartzCore', 'Security', 'UIKit', 'Foundation', 'CoreGraphics','CoreTelephony','WebKit'
  s.libraries = 'sqlite3', 'z'

  s.pod_target_xcconfig = {
    # 为模拟器构建时定义一个宏，用于条件编译
    "GCC_PREPROCESSOR_DEFINITIONS[sdk=iphonesimulator*]" => "TARGET_IPHONE_SIMULATOR=1",
    # 为真机构建时定义另一个宏
    "GCC_PREPROCESSOR_DEFINITIONS[sdk=iphoneos*]" => "TARGET_IPHONE_SIMULATOR=0",
    
    # 为模拟器构建时移除Weibo_SDK的链接
    "OTHER_LDFLAGS[sdk=iphonesimulator*]" => "$(inherited)",
    # 为真机构建时正常链接Weibo_SDK
    "OTHER_LDFLAGS[sdk=iphoneos*]" => "$(inherited) -lWeiboSDK"
  }
end
