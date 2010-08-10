@interface EBTimelineItem : TTTableItem 
{
	NSString *username;
	NSString *avatarImageURL;
	NSDate *date;
	NSString *message;
	NSString *URL;
}

+ (id)itemWithUsername:(NSString *)inUsername avatarImageURL:(NSString *)inAvatarImageURL date:(NSDate *)inDate message:(NSString *)inMessage URL:(NSString *)inURL;

@property (retain, nonatomic) NSString *username;
@property (retain, nonatomic) NSString *avatarImageURL;
@property (retain, nonatomic) NSDate *date;
@property (retain, nonatomic) NSString *message;
@property (readonly, nonatomic) TTStyledText *styledMessage;
@property (retain, nonatomic) NSString *URL;

@end
