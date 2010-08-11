#import "EBPrivatePlurksModel.h"

@implementation EBPrivatePlurksModel

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more 
{
	if (!self.isLoading) {
		if (!more) {
			[[ObjectivePlurk sharedInstance] retrieveMessagesWithDateOffset:nil limit:0 user:nil isResponded:NO isPrivate:YES delegate:self userInfo:nil];
			loading = YES;
			[self didStartLoad];
		}
		else {
			NSDictionary *message = [messages lastObject];
			NSString *posted = [message valueForKey:@"posted"]; 		
			NSDate *date = [self dateFromString:posted];
			[[ObjectivePlurk sharedInstance] retrieveMessagesWithDateOffset:date limit:0 user:nil isResponded:NO isPrivate:YES delegate:self userInfo:nil];
			loading = YES;
			loadingMore = YES;
			[self didStartLoad];
		}
	}
}


@end
