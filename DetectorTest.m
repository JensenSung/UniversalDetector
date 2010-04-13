#import <Foundation/Foundation.h>

#import <UniversalDetector/UniversalDetector.h>

int main(int argc,char **argv)
{
	NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];

	UniversalDetector *detector=[UniversalDetector detector];

	for (int i = 1; i < argc; i++)
	{
		NSData *data=[NSData dataWithContentsOfFile:[NSString stringWithUTF8String:argv[i]]];
		[detector analyzeData:data];
	}

	NSString *str = [NSString stringWithFormat:@"\"%@\" (%s) confidence: %.1f%%\n", 
					 [NSString localizedNameOfStringEncoding:[detector encoding]], 
					 [[detector MIMECharset] UTF8String], 
					 ([detector confidence]*100.0f) 
					 ];
	printf("%s", [str cStringUsingEncoding:NSUTF8StringEncoding]);

	[pool release];
	return 0;
}