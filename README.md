# DVVFixModalPresentationStyle
解决在 iOS 13 上 UIViewController 的 modalPresentationStyle 值变成了 UIModalPresentationPageSheet，而不是默认的 UIModalPresentationFullScreen，导致之前通过 presentViewController:animated:completion: 方法弹出的控制器效果非全屏的问题

通过这种 Category 和 Method Swizzling 的方式，则无需处理之前大量的控制器没有设置 modalPresentationStyle 的问题，同时也不影响之前设置过 modalPresentationStyle 的控制器。

## 使用方式
在`Podfile`里添加此行内容：
```
pod 'DVVFixModalPresentationStyle', :git => 'https://github.com/devdawei/DVVFixModalPresentationStyle.git', :tag => 'v1.0.0'
```

然后在`Terminal`中`cd`到工程目录，执行如下命令：
```
pod install
```

没有使用 CocoaPods 的项目则只需要把`DVVFixModalPresentationStyle`文件夹拖到项目中即可。
