//
//  UIViewController+DVVFixModalPresentationStyle.h
//  DVVFixModalPresentationStyle
//
//  Created by David on 2019/8/20.
//  Copyright © 2019 David. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (DVVFixModalPresentationStyle)

#ifdef __IPHONE_13_0
@property (nonatomic, assign) BOOL dvv_didSetModalPresentationStyle API_AVAILABLE(ios(13.0));
#endif

@end

NS_ASSUME_NONNULL_END
