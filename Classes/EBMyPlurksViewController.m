#import "EBMyPlurksViewController.h"
#import "EBTimelineDataSource.h"
#import "EBMyPlurksModel.h"

@implementation EBMyPlurksViewController

- (id)init
{
	self = [super init];
	if (self != nil) {
		self.title = NSLocalizedString(@"My", @"");
	}
	return self;
}

- (void)createModel 
{
	self.dataSource = [[[EBTimelineDataSource alloc] initWithModelClass:[EBMyPlurksModel class]] autorelease];
}

@end
