#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
#import "CarDrSDK/CarDrSDK-Swift.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
//  self.reactBridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
  self.moduleName = @"AwesomeProject";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};
  
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

//+ (NSString *)moduleName {
//  
//  CarDrConnectionApi * obj = [[CarDrConnectionApi alloc] init];
//  
//  [obj connectOBDWithUserName:@"" password:@""];
//}

//RCT_EXPORT_MODULE();
//
//
//RCT_EXPORT_METHOD(findEvent:(RCTResponseSenderBlock)callback){
//
////  CarDrConnectionApi * obj = [[CarDrConnectionApi alloc] init];
////  [obj setCdCallBack:self];
////  NSTimeInterval delayInSeconds = 10.0;
////  dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
////  dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
////    NSLog(@"Do some work");
////    [obj connectOBDWithUserName:@"VOYO_Guest1" password:@"guest"];
////  });
//
//
//
//}


@end
