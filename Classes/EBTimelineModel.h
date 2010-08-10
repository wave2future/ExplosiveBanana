#import "ObjectivePlurk.h"
#import "EBTimelineItem.h"

@interface EBTimelineModel : TTModel 
{
	NSMutableDictionary *users;
	NSMutableArray *messages;
	BOOL loading;
	BOOL loaded;
}

@property (readonly) NSArray *messageItems;

@end
