
#import <Foundation/Foundation.h>
#include <CoreFoundation/CoreFoundation.h>
#include <CoreGraphics/CoreGraphics.h>
#import <ControlCenterUIKit/CCUIToggleModule.h>

#define POST_NOTIF(_name)                       CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(),\
                                                CFSTR(_name), NULL, NULL, YES);

@interface PowerUpCCModule : CCUIToggleModule
{
  BOOL _selected;
}

@end
