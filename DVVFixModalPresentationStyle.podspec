

Pod::Spec.new do |s|

s.name         = 'DVVFixModalPresentationStyle'
s.summary      = '解决在 iOS 13 上 因 modalPresentationStyle 值变成了 UIModalPresentationPageSheet，导致之前通过 presentViewController:animated:completion: 方法弹出的控制器效果非全屏的问题'
s.version      = '1.0.0'
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.authors      = { 'devdawei' => '2549129899@qq.com' }
s.homepage     = 'https://github.com/devdawei'

s.platform     = :ios
s.ios.deployment_target = '7.0'
s.requires_arc = true

s.source       = { :git => 'https://github.com/devdawei/DVVFixModalPresentationStyle.git', :tag => s.version.to_s }

s.source_files = 'DVVFixModalPresentationStyle/*.{h,m}'

s.frameworks = 'Foundation', 'UIKit'

end
