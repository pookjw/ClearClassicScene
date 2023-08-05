#import <UIKit/UIKit.h>
#import <substrate.h>

namespace _UIView {
    namespace setBackgroundColor {
        void (*original)(id, SEL, id);
        void custom(id self, SEL _cmd, id arg0) {
            if ([self isKindOfClass:NSClassFromString(@"SBDeviceApplicationSceneView")]) {
                original(self, _cmd, UIColor.clearColor);
            } else {
                original(self, _cmd, arg0);
            }
        }
    }
}

__attribute__((constructor)) static void init() {
    @autoreleasepool {
        MSHookMessageEx(
            UIView.class,
            @selector(setBackgroundColor:),
            reinterpret_cast<IMP>(_UIView::setBackgroundColor::custom),
            reinterpret_cast<IMP *>(&_UIView::setBackgroundColor::original)
        );
    }
}
