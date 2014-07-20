/*
 
 The MIT License (MIT)
 
 Copyright (c) 2014 Mustafa Ahmed Abduljabbar
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 */

#import "WirelessAPI.h"

@implementation WirelessAPI

static WirelessAPI *sharedApi=  nil;


+(id)getSharedInstance{
    if (sharedApi == nil) {
        sharedApi = [[super allocWithZone:NULL]init];
    }
    return sharedApi;
}

-(id)init{
    
    if (self = [super init]) {
        //// This Required you to put your application under /Application/ in order to access this private library
        network = [[NSMutableDictionary alloc]init];
        networks = [[NSMutableArray alloc]init];
        
        
        
        libHandle = dlopen("/System/Library/SystemConfiguration/IPConfiguration.bundle/IPConfiguration", 0x1);
        char *error;
        if (libHandle == NULL && (error = dlerror()) != NULL)  {
            NSLog(@"%s",error);
            exit(1);
        }
        apple80211Open = dlsym(libHandle, "Apple80211Open");
        apple80211Bind = dlsym(libHandle, "Apple80211BindToInterface");
        apple80211Close = dlsym(libHandle, "Apple80211Close");
        apple80211Scan = dlsym(libHandle, "Apple80211Scan");

        apple80211Open(&airportHandle);
        apple80211Bind(airportHandle, @"en0"); //// This is the wireless interface . if you are a little bit hacky you can plugin your own wireless device and write it's own interface !
    }
    return self;
}


-(NSArray *)fatchWifiSignles{
    

	
    NSArray *scan_networks;
	apple80211Scan(airportHandle, &scan_networks, NULL); //// You can replace NULL With some parameters ...
    [networks setArray:scan_networks];
    return networks;
    
}

-(NSDictionary *)networkInfo:(NSString *)bssid{
    [self fatchWifiSignles];
    
    for (int i = 0; i < [networks count]; i++) {
		[network setObject:[networks objectAtIndex: i] forKey:[[networks objectAtIndex: i] objectForKey:@"BSSID"]];
	}
    return [network objectForKey:bssid];
}

-(void)turnDown{
    apple80211Close(airportHandle);
}
@end
