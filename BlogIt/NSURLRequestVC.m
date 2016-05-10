//
//  NSURLRequestVC.m
//  BlogIt
//
//  Created by Donovan Cotter on 5/10/16.
//  Copyright © 2016 DonovanCotter. All rights reserved.
//

#import "NSURLRequestVC.h"

@interface NSURLRequestVC ()

@end

@implementation NSURLRequestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self foursquareCoffeeShopsInDetroit];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)foursquareCoffeeShopsInDetroit{
    
    NSString *categoryID = @"4bf58dd8d48988d125941735";
    NSString *foursquareAPIClientID = @"CFITOPDZUHBDVUIVCHOC5XUCVZ5OVHE40RIIUZA2AZXLSMUZ";
    NSString *foursquareAPIClientSecret = @"E4EG5TBFZDLGUSJDEOGMFRNAQCDU03W3JQDBD0T31G5HH35J";
    
    NSString *URLString = [NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?ll=42.3314,-83.0457&categoryId=%@&v=20130815&client_id=%@&client_secret=%@", categoryID, foursquareAPIClientID, foursquareAPIClientSecret];
    
    NSURL *URL = [NSURL URLWithString:URLString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if (httpResponse.statusCode == 200) {
            
            NSError *JSONError;
            
            NSMutableDictionary *JSONDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &JSONError];
            
            NSLog(@"%@", JSONDict);
            
            NSMutableArray *venuesArray = [JSONDict valueForKeyPath:@"response.venues"];
            
            for (NSDictionary *venue in venuesArray) {
                NSLog(@"%@", [venue valueForKey:@"name"]);
            }
        } else {
            NSLog(@"ERROR: %@", error);
        }
        
    }];
    [dataTask resume];
}



@end
