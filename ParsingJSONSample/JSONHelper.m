//
//  JSONHelper.m
//  ParseJSONFromWCF
//
//  Created by Anusha Tondapu on 08/06/14.
//  Copyright (c) 2014 SampleOrganization. All rights reserved.
//

#import "JSONHelper.h"

@implementation JSONHelper

+(NSDictionary *)parseJsonResponse:(NSString *)urlString
{
    NSError *error;
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse: nil error:&error];
    if (!data)
    {
        NSLog(@"Download Error: %@", error.localizedDescription);
        UIAlertView *alert =
        [[UIAlertView alloc]initWithTitle:@"Error"
                                  message:[NSString stringWithFormat:@"Error : %@",error.localizedDescription]
                                 delegate:self
                        cancelButtonTitle:@"Ok"
                        otherButtonTitles:nil];
        [alert show];
        return nil;
    }
    
    // Parse the (binary) JSON data from the web service into an NSDictionary object
    NSDictionary *JSON =
    [NSJSONSerialization JSONObjectWithData: data
                                    options: NSJSONReadingMutableContainers
                                      error: &error];
    return JSON;
}

@end
