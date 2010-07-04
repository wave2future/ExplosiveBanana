#import "EBAppDelegate.h"
#import "EBLoginViewController.h"

@implementation EBAppDelegate

- (void)dealloc 
{
	[navigationController release];
	[window release];
	[super dealloc];
}


#pragma mark -
#pragma mark Application lifecycle

- (void)showLoginView
{
	EBLoginViewController *loginViewController = [[EBLoginViewController alloc] initWithStyle:UITableViewStyleGrouped];
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
	[loginViewController release];
	[self.navigationController presentModalViewController:navController animated:YES];
	[navController release];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	[ObjectivePlurk sharedInstance].APIKey = PLURK_API_KEY;
	
	self.window = [[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds] autorelease];
	TTViewController *controller = [[TTViewController alloc] init];	
	self.navigationController = [[[UINavigationController alloc] initWithRootViewController:controller] autorelease];
	[controller release];
    [window addSubview:navigationController.view];
    [window makeKeyAndVisible];
	
	[self showLoginView];
	
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


@synthesize window;
@synthesize navigationController;


@end

