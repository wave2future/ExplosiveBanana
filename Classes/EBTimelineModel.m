#import "EBTimelineModel.h"

@implementation EBTimelineModel

- (void) dealloc
{
	[users release];
	[messages release];
	[super dealloc];
}

- (id)init
{
	self = [super init];
	if (self != nil) {
		users = [[NSMutableDictionary alloc] init];
		messages = [[NSMutableArray alloc] init];
		loaded = NO;
	}
	return self;
}


- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more 
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	if (!self.isLoading) {
		[users removeAllObjects];
		[messages removeAllObjects];
		[[ObjectivePlurk sharedInstance] retrieveMessagesWithDateOffset:nil limit:0 user:nil isResponded:NO isPrivate:NO delegate:self userInfo:nil];
		[self didStartLoad];
		loading = YES;
	}
}

- (BOOL)isLoaded
{
	return loaded;
}
- (BOOL)isLoading
{
	return loading;
}

- (void)plurk:(ObjectivePlurk *)plurk didRetrieveMessages:(NSDictionary *)result
{
	[users addEntriesFromDictionary:[result valueForKey:@"plurk_users"]];
	[messages addObjectsFromArray:[result valueForKey:@"plurks"]];	
	[self didFinishLoad];
	loading = NO;
	loaded = YES;
}
- (void)plurk:(ObjectivePlurk *)plurk didFailRetrievingMessages:(NSError *)error
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	[self didFailLoadWithError:error];
	loading = NO;
	loaded = YES;
}

- (NSArray *)messageItems
{
	NSMutableArray *array = [NSMutableArray array];
	for (NSDictionary *message in messages) {
		NSString *ownerID = [message valueForKey:@"owner_id"];
		if ([ownerID isKindOfClass:[NSNumber class]]) {
			ownerID = [(NSNumber *)ownerID stringValue];
		}
		NSDictionary *userDictionary = [users valueForKey:ownerID];
		NSString *name = [userDictionary valueForKey:@"display_name"];
		BOOL hasProfileImage = [[userDictionary valueForKey:@"has_profile_image"] boolValue];
		NSString *avatar = [userDictionary valueForKey:@"avatar"];
		if ([avatar isKindOfClass:[NSNumber class]]) {
			avatar = [(NSNumber *)avatar stringValue];			
		}
		NSString *html = [message valueForKey:@"content"];
		
		NSString *imageURL = [[ObjectivePlurk sharedInstance] imageURLStringForUser:ownerID size:OPMediumUserProfileImageSize hasProfileImage:hasProfileImage avatar:avatar];
		NSString *posted = [message valueForKey:@"posted"]; //  "Tue, 10 Aug 2010 16:12:31 GMT";		
		EBTimelineItem *item = [EBTimelineItem itemWithUsername:name avatarImageURL:imageURL date:nil message:html URL:nil];
		[array addObject:item];
	}
	
	return array;
}


@end
