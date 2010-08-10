#import "EBTimelineItem.h"

@implementation EBTimelineItem

- (void)dealloc
{
	TT_RELEASE_SAFELY(username);
	TT_RELEASE_SAFELY(avatarImageURL);
	TT_RELEASE_SAFELY(date);
	TT_RELEASE_SAFELY(message);
	TT_RELEASE_SAFELY(URL);
	[super dealloc];
}


+ (id)itemWithUsername:(NSString *)inUsername avatarImageURL:(NSString *)inAvatarImageURL date:(NSDate *)inDate message:(NSString *)inMessage URL:(NSString *)inURL;
{
	EBTimelineItem *item = [[EBTimelineItem alloc] init];
	item.username = inUsername;
	item.avatarImageURL = inAvatarImageURL;
	item.date = inDate;
	item.message = inMessage;
	item.URL = inURL;
	return [item autorelease];
}

- (id)init
{
	self = [super init];
	if (self != nil) {
		username = nil;
		avatarImageURL = nil;
		date = nil;
		message = nil;
		URL = nil;
	}
	return self;
}

- (TTStyledText *)styledMessage
{
	return [TTStyledText textFromXHTML:self.message];
}

@synthesize username;
@synthesize avatarImageURL;
@synthesize date;
@synthesize message;
@synthesize URL;

@end
