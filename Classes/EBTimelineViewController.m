#import "EBTimelineViewController.h"
#import "EBTimelineDataSource.h"

@implementation EBTimelineViewController

- (void)loadView 
{
    [super loadView];    	
    self.variableHeightRows = YES;
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reload:)];
	self.navigationItem.leftBarButtonItem = item;
	[item release];	
}  

- (void)viewDidLoad
{
	[super viewDidLoad];
}

- (void)createModel 
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	self.dataSource = [[[EBTimelineDataSource alloc] init] autorelease];
}

- (IBAction)reload:(id)sender
{
	[self reload];
}

@end
