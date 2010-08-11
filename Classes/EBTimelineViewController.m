#import "EBTimelineViewController.h"
#import "EBTimelineDataSource.h"
#import "EBTimelineModel.h"

@implementation EBTimelineViewController

- (id)init
{
	self = [super init];
	if (self != nil) {
		self.title = NSLocalizedString(@"All Plurks", @"");
	}
	return self;
}

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
	self.dataSource = [[[EBTimelineDataSource alloc] initWithModelClass:[EBTimelineModel class]] autorelease];
}

- (IBAction)reload:(id)sender
{
	[self showLoading:YES];
	[self reload];
}

- (void)modelDidFinishLoad:(id<TTModel>)model
{
	if (model == _model) {
		TT_RELEASE_SAFELY(_modelError);
		_flags.isModelDidLoadInvalid = YES;
		[self invalidateView];
		[self showLoading:NO];
	}
}

- (void)model:(id<TTModel>)model didFailLoadWithError:(NSError*)error 
{
	if (model == _model) {
		self.modelError = error;
		[self showLoading:NO];
	}
}


@end
