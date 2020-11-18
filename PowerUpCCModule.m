#import "PowerUpCCModule.h"
#import "ControlCenterUI/ControlCenterUI-Structs.h"
#import <UIKit/UIKit.h>

@implementation PowerUpCCModule
static bool kEnabled;
//Return the icon of your module here
- (UIImage *)iconGlyph
{
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil];
}

- (CCUILayoutSize)moduleSizeForOrientation:(int)orientation
{
	CCUILayoutSize size;
    //Default value
    size.height = 1;
    //Default value
    size.width = 1;

	return size;
}

//Return the color selection color of your module here
- (UIColor *)selectedColor{
	return [UIColor blueColor];
}

- (BOOL)isSelected{

	NSDictionary *prefs = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.kurrtandsquiddy.powerup"];
	if (prefs) {
		kEnabled  = [prefs objectForKey:@"kEnabled"] ? [[prefs objectForKey:@"kEnabled"] boolValue] : YES;
    if (kEnabled){
      _selected = true;
    }
  }
  return _selected;
}

- (void)setSelected:(BOOL)selected{
  _selected = selected;
  [super refreshState];

  NSMutableDictionary *prefs = [[[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.kurrtandsquiddy.powerup"] mutableCopy];
  if(_selected){
    [prefs setObject:@YES forKey:@"kEnabled"];
    [[NSUserDefaults standardUserDefaults] setPersistentDomain:prefs forName:@"com.kurrtandsquiddy.powerup"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    //Your module got selected, do something
  }
  else{
    [prefs setObject:@NO forKey:@"kEnabled"];
    [[NSUserDefaults standardUserDefaults] setPersistentDomain:prefs forName:@"com.kurrtandsquiddy.powerup"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    //[[ux sharedInstance] hide_confirmAlert:nil];
    //Your module got unselected, do something
  }
  POST_NOTIF("com.kurrtandsquiddy.powerup/settingschanged");
}

@end
