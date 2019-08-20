//
//  UIViewController+DVVFixModalPresentationStyle.m
//  DVVFixModalPresentationStyle
//
//  Created by David on 2019/8/20.
//  Copyright © 2019 David. All rights reserved.
//

#import "UIViewController+DVVFixModalPresentationStyle.h"
#import <objc/runtime.h>

@implementation UIViewController (DVVFixModalPresentationStyle)

#ifdef __IPHONE_13_0
+ (void)load {
    if (@available(iOS 13.0, *)) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [self dvv_swizzlingInstanceMethodWithClass:self.class
                                                 originSel:@selector(setModalPresentationStyle:)
                                              swizzlingSel:@selector(dvv_setModalPresentationStyle:)];
            [self dvv_swizzlingInstanceMethodWithClass:self.class
                                             originSel:@selector(presentViewController:animated:completion:)
                                          swizzlingSel:@selector(dvv_presentViewController:animated:completion:)];
        });
    }
}

static char kDVVDidSetModalPresentationStyle;

- (void)setDvv_didSetModalPresentationStyle:(BOOL)dvv_didSetModalPresentationStyle {
    objc_setAssociatedObject(self, &kDVVDidSetModalPresentationStyle, @(dvv_didSetModalPresentationStyle), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)dvv_didSetModalPresentationStyle {
    id obj = objc_getAssociatedObject(self, &kDVVDidSetModalPresentationStyle);
    if (obj) {
        return [obj boolValue];
    } else {
        return NO; // default value.
    }
}

- (void)dvv_setModalPresentationStyle:(UIModalPresentationStyle)modalPresentationStyle {
    if (@available(iOS 13.0, *)) {
        self.dvv_didSetModalPresentationStyle = YES;
    }
    [self dvv_setModalPresentationStyle:modalPresentationStyle];
}

- (void)dvv_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    if (@available(iOS 13.0, *)) {
        if (!viewControllerToPresent.dvv_didSetModalPresentationStyle &&
            viewControllerToPresent.modalPresentationStyle == UIModalPresentationPageSheet) {
            viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
        }
    }
    [self dvv_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

#pragma mark - Method Swizzling

+ (void)dvv_swizzlingInstanceMethodWithClass:(Class)cls originSel:(SEL)originSel swizzlingSel:(SEL)swizzlingSel {
    Method originMethod = class_getInstanceMethod(cls, originSel);
    Method swizzlingMethod = class_getInstanceMethod(cls, swizzlingSel);
    BOOL didAddMethod = class_addMethod(cls,
                                        originSel,
                                        method_getImplementation(swizzlingMethod),
                                        method_getTypeEncoding(swizzlingMethod));
    if (didAddMethod) {
        class_replaceMethod(cls,
                            swizzlingSel,
                            method_getImplementation(originMethod),
                            method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, swizzlingMethod);
    }
}
#endif

@end
