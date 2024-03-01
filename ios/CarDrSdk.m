//
//  CarDrSdk.m
//  AwesomeProject
//
//  Created by Arvind Mehta on 26/07/23.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"



@interface RCT_EXTERN_MODULE(CarDrSdk,RCTEventEmitter)
//RCT_EXTERN_METHOD(connectOBD:(NSString*)userName (NSString*)passWord);
RCT_EXTERN_METHOD(getPCF:(NSString*)vin (NSString*)dtc (NSString*)token (NSString)key);
RCT_EXTERN_METHOD(initialize);
RCT_EXTERN_METHOD(disconnectOBD);
RCT_EXTERN_METHOD(connectOBD:(NSString*)param1 param2:(NSString*)param2);
@end
