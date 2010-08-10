#import "EBTimelineDataSource.h"
#import "EBTimelineCell.h"

@implementation EBTimelineDataSource

- (void)dealloc 
{
	TT_RELEASE_SAFELY(timelineModel);	
	[super dealloc];
}

- (id)init
{
	self = [super init];
	if (self != nil) {
		NSLog(@"init model");
		timelineModel = [[EBTimelineModel alloc] init];
	}
	return self;
}

- (id<TTModel>)model 
{
	return timelineModel;
}

- (void)tableViewDidLoadModel:(UITableView*)tableView 
{
	self.items = [NSMutableArray arrayWithArray:timelineModel.messageItems];
}

- (NSString *)titleForLoading:(BOOL)reloading 
{
	if (reloading) {
		return NSLocalizedString(@"Updating...", @"");
	}
	else {
		return NSLocalizedString(@"Loading ...", @"");
	}
}
- (NSString *)titleForEmpty 
{
	return NSLocalizedString(@"No posts found.", @"");
}
- (NSString *)subtitleForError:(NSError *)error
{
	return NSLocalizedString(@"Sorry, there was an error loading the Plurk stream.", @"");
}

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object
{	
    if ([object isKindOfClass:[EBTimelineItem class]]) {  
        return [EBTimelineCell class];  
    }
	return [super tableView:tableView cellClassForObject:object];
}  

- (void)tableView:(UITableView*)tableView prepareCell:(UITableViewCell*)cell forRowAtIndexPath:(NSIndexPath*)indexPath 
{
    cell.accessoryType = UITableViewCellAccessoryNone;  
}  


@end
