#import "EBAppDelegate.h"
#import "EBLoginViewController.h"
#import "EBTimelineViewController.h"

@implementation EBAppDelegate

- (void)dealloc 
{
	[super dealloc];
}


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[ObjectivePlurk sharedInstance].APIKey = PLURK_API_KEY;

	TTNavigator *navigator = [TTNavigator navigator];
	navigator.supportsShakeToReload = YES;
	navigator.persistenceMode = TTNavigatorPersistenceModeAll;
	UIWindow *window = [[[UIWindow alloc] initWithFrame:TTScreenBounds()] autorelease];
	window.backgroundColor = [UIColor blackColor];
	navigator.window = window;

	TTURLMap* map = navigator.URLMap;
	[map from:@"*" toViewController:[TTWebController class]];
	[map from:@"banana://login" toModalViewController:[EBLoginViewController class]];
	[map from:@"banana://timeline" toModalViewController:[EBTimelineViewController class]];		
	
	[navigator.window makeKeyAndVisible];

	if (![[ObjectivePlurk sharedInstance] resume]) {	
		[navigator openURLs:@"banana://login", nil];
	}
	else {
		[navigator openURLs:@"banana://timeline", nil];
	}

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
}
- (void)applicationDidEnterBackground:(UIApplication *)application 
{
}
- (void)applicationWillEnterForeground:(UIApplication *)application 
{
}
- (void)applicationDidBecomeActive:(UIApplication *)application 
{
}
- (void)applicationWillTerminate:(UIApplication *)application
{
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application 
{
}


//@synthesize window;
//@synthesize navigationController;


@end

