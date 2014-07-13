//
//  JSONHelper.h
//  ParseJSONFromWCF
//
//  Created by Anusha Tondapu on 08/06/14.
//  Copyright (c) 2014 SampleOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONHelper : NSObject
+(NSDictionary *)parseJsonResponse:(NSString *)urlString;
@end
