#import "BERespondedPlurksViewController.h"
#import "EBTimelineDataSource.h"
#import "EBRespondedPlurksModel.h"

@implementation BERespondedPlurksViewController

- (id)init
{
	self = [super init];
	if (self != nil) {
		self.title = NSLocalizedString(@"Responded", @"");
	}
	return self;
}

- (void)createModel 
{
	self.dataSource = [[[EBTimelineDataSource alloc] initWithModelClass:[EBRespondedPlurksModel class]] autorelease];
}

@end
