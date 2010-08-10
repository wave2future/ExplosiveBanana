#import "ObjectivePlurk.h"
#import "EBTimelineItem.h"

@interface EBTimelineModel : TTModel 
{
	NSMutableDictionary *users;
	NSMutableArray *messages;
	NSDateFormatter *dateFormatter;
	BOOL loading;
	BOOL loaded;
	BOOL loadingMore;
	BOOL wasLoadingMore;
}

@property (readonly) NSArray *messageItems;
@property (readonly) BOOL wasLoadingMore;

@end
