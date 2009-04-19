#import <Foundation/Foundation.h>

// test just to print a string to the console log
void PrintString() {
	NSString *aString = @"Johnny";
	NSLog(@"=========================================");
	NSLog(@"Logging a string.");
	NSLog(@"-----------------------------------------");
	NSLog([NSString stringWithFormat: @"It's '%@'", aString]);
}

// Section 1: Strings as file system paths
void PrintPathInfo() {
	// set a home directory path using a tilde and then expand it
	NSString *path = @"~";
	NSString *fullPath = path.stringByExpandingTildeInPath;
	NSLog(@"=========================================");
	NSLog(@"Expanding the ~ path");
	NSLog(@"-----------------------------------------");
	NSLog([NSString stringWithFormat: @"My home folder is at '%@'", path]);
	NSLog([NSString stringWithFormat: @"My home folder is at '%@'", fullPath]);
	
	// create an array of each path component
	NSArray *pathComponents = [fullPath pathComponents];
	NSLog(@"=========================================");
	NSLog(@"Listing each component of the path");
	NSLog(@"-----------------------------------------");
	// interate through the array and log each component as a string
	for (NSString *component in pathComponents) {
		NSLog(component);
	}
}

//Section 2: Finding out a bit about our own process
void  PrintProcess() {
	NSString *processName = [[NSProcessInfo processInfo] processName];
	NSInteger processIdentifier = [[NSProcessInfo processInfo] processIdentifier];
	NSLog(@"=========================================");
	NSLog(@"Printing the process name and id");
	NSLog(@"-----------------------------------------");
	NSLog([NSString stringWithFormat:@"Process Name: '%@' Process ID: '%d'", processName, processIdentifier]);
}

//Section 3: A little bookmark dictionary
void  PrintBookmarkDictionary() {
	NSMutableDictionary *bookmarks = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
									  [NSURL URLWithString: @"http://www.stanford.edu"], @"Stanford University",
									  [NSURL URLWithString: @"http://www.apple.com"], @"Apple",
									  [NSURL URLWithString: @"http://cs193p.stanford.edu"], @"CS193P",
									  [NSURL URLWithString: @"http://itunes.stanford.edu"], @"Stanford on iTunes U",
									  [NSURL URLWithString: @"http://stanfordshop.com"], @"Stanford Mall",
									  nil
									  ];
	NSLog(@"=========================================");
	NSLog(@"All keys matching 'Stanford'");
	NSLog(@"-----------------------------------------");
	//NSArray *keys = [bookmarks allKeys];
	//NSArray *values	= [bookmarks allValues];
	for (NSString *key in bookmarks) {
		// Only log the entries with a key that begins with 'Stanford'
		if ([key hasPrefix:@"Stanford"]) {
		// Log the key and value for each entry in the dictionary
		NSLog(@"Key: '%@' Value: '%@'", key, [bookmarks objectForKey:key]);
		}
	}
}

//Section 4: Selectors, Classes and Introspection
void PrintObjectDetails() {
	
	// Initialize a mutable array object
	NSMutableArray *myArray = [NSMutableArray new];
	
	// add some strings
	[myArray addObject: [NSString stringWithFormat: @"I'm a string."]];
	[myArray addObject: @"Second String"];
	
	// add an NSURL object
	[myArray addObject: [NSURL URLWithString: @"http://www.stanford.edu"]];
	
	// add an NSProcesssInfo object (this is actually the string processName from the NSProcessInfo object)
	[myArray addObject: [[NSProcessInfo processInfo] processName]];
	
	// add an NSProcessInfo object (actually an int for the process ID)
	// Can't add an integer to an array, so you must convert it to a NSNumber object
	NSInteger processIdentifier = [[NSProcessInfo processInfo] processIdentifier];
	[myArray addObject: [NSNumber numberWithInteger: processIdentifier]];
	
	// add a dictionary
	NSMutableDictionary *aMutableDictionary;
	aMutableDictionary = [NSMutableDictionary alloc];
	[aMutableDictionary initWithObjectsAndKeys: @"blue (value)", @"color (key)", nil];
	[myArray addObject: aMutableDictionary];
	
	// add a mutable string object
	NSMutableString *aMutableString = @"a mutable string";
	[myArray addObject:aMutableString];
	
	// Enumerate through the array's objects
	for (NSString *object in myArray) {
		NSLog(@"========================================");
		// print the class name of the object
		NSLog(@"Class Name: '%@'", [object className]);
		if ([object isMemberOfClass:[NSString class]]) {
			NSLog(@"Member of NSString: Yes");
		} else {
			NSLog(@"Member of NSString: No");
		}
		// check to see if the object is a member of the NSString class
		if ([object isKindOfClass:[NSString class]]) {
			NSLog(@"Kind of NSString: Yes");
		} else {
			NSLog(@"Kind of NSString: No");
		}
		// If the object is a member of NSString, then apply the lowercaseString method to it
		if ([object isKindOfClass:[NSString class]]) {
			NSLog(@"Responds to lowercaseString: Yes");
			NSLog(@"Lowercase string is '%@'", [object lowercaseString]);
		} else {
			NSLog(@"Does not respond to lowercaseString");
		}
		// A much more sophisticated way to do this
		NSLog(@"Responds to lowercaseString: '%@'", [object respondsToSelector:@selector(lowercaseString)] ? @"YES" : @"NO");
		
		// This is the correct way to determin if a selector will act on receiver
		if ([object respondsToSelector:@selector(lowercaseString)]) {
			NSLog(@"YIPPEE!!");
		}
	}
}



int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	PrintString();
	PrintPathInfo();
	PrintProcess();
	PrintBookmarkDictionary();
	PrintObjectDetails();
	
    [pool drain];
    return 0;
}
