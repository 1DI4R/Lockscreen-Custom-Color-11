#import <libcolorpicker.h>
#import <UIKit/UIKit.h>
#import <substrate.h>


/*NSMutableDictionary *settings =
[NSMutableDictionary dictionaryWithContentsOfFile:[NSString stringWithFormat:@"%@/Library/Preferences/%@",NSHomeDirectory(),@"cf.1di4r.lscustomcolor11prefs.plist"]];
NSNumber* shouldNotify = [settings objectForKey:@"isEnabled"];*/
static BOOL isEnabled = NO;
static void loadPrefs() {
	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/cf.1di4r.lscustomcolor11prefs.plist"];

	isEnabled = [settings objectForKey:@"isEnabled"] ? [[settings objectForKey:@"isEnabled"] boolValue] : NO;

}

%hook SBUILegibilityLabel

- (void)setTextColor:(id)arg1 {
  loadPrefs();
	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/cf.1di4r.lscustomcolor11prefs.plist"];

  if (isEnabled == YES)
   {

    arg1 = (LCPParseColorString([settings objectForKey:@"Color"], @"#ff0000"));

}else{

  return %orig;

}

}
%end
%hook SBUILegibilityLabel
- (id)textColor {
  loadPrefs();
	NSMutableDictionary *settings = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/cf.1di4r.lscustomcolor11prefs.plist"];

  if (isEnabled == YES)
   {

    return (LCPParseColorString([settings objectForKey:@"Color"], @"#FF0000"));

}else{
  return %orig;
}
}
%end

%ctor {
    loadPrefs();
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("cf.1di4r.lscustomcolor11prefs/saved"), NULL, CFNotificationSuspensionBehaviorCoalesce);

}
