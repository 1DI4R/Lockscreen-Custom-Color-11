#include "LCPRootListController.h"
#include<spawn.h>
#import "../libcolorpicker.h"



#define kColor @"Color"




@implementation LCPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}\

- (void)viewWillAppear:(BOOL)animated
{

	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{


	[super viewDidAppear:animated];
}

- (void)colorpicker
{

	NSMutableDictionary *prefsDict = [NSMutableDictionary dictionaryWithContentsOfFile:@"/User/Library/Preferences/cf.1di4r.lscustomcolor11prefs.plist"];
	NSString *readFromKey = prefsDict[kColor];

 UIColor *startColor = LCPParseColorString(readFromKey, kColor);
 PFColorAlert *alert = [PFColorAlert colorAlertWithStartColor:startColor showAlpha:YES];

if (!prefsDict) prefsDict = [NSMutableDictionary dictionary];

	 // init WILL GET RELEASED ON CLOSE

	//PFColorAlert *alert = [PFColorAlert colorAlertWithStartColor:startColor showAlpha:YES];

// show alert and set completion callback
			// show alert                               // Show alpha slider? // Code to run after close
			[alert displayWithCompletion: ^void (UIColor *pickedColor) {
    NSString *hexString = [UIColor hexFromColor:pickedColor];
					hexString = [hexString stringByAppendingFormat:@":%g", pickedColor.alpha]; //if you want to use alpha
					//                                                                                                                              ^^ parse fallback to ^red
					// save hexString to your plist if desired

					[prefsDict setValue:hexString forKey:@"Color"];
	 [prefsDict writeToFile:@"/User/Library/Preferences/cf.1di4r.lscustomcolor11prefs.plist" atomically:YES];
}];

}

-(void)respring {


	pid_t pid;
    int status;
    const char* args[] = {"killall", "SpringBoard", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);

      }
			-(void)twitter {
				[[UIApplication sharedApplication]
				openURL:[NSURL URLWithString:@"https://twitter.com/1DI4R"]
				options:@{}
				completionHandler:nil];
					}
					-(void)paypal {
						[[UIApplication sharedApplication]
						openURL:[NSURL URLWithString:@"https://paypal.me/dyarib/2"]
						options:@{}
						completionHandler:nil];
							}


@end
