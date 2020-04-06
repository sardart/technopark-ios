//
//  ViewController.m
//  ynav_test
//
//  Created by d.taraev on 27.05.17.
//  Copyright © 2017 mail.ru. All rights reserved.
//

#import "ViewController.h"
#import <Photos/Photos.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    //bundledisplayname
    [super viewDidLoad];
}


- (IBAction)openInNavigatorAppTapped:(UIButton *)sender {
    NSString *address = @"Синема 5 Парк Хаус, просп. Ямашева, 46/33, ТРК «Парк Хаус», Казань";
    NSURL *baseURL = [NSURL URLWithString:@"https://maps.apple.com/"];
    NSMutableArray<NSURLQueryItem *> *queryItems = [[NSMutableArray alloc] init];
    [queryItems addObject:[[NSURLQueryItem alloc] initWithName:@"q" value:address]];
    NSURL *mapsURL = [self mrutils_URLByAppendingQueryItems:baseURL items:queryItems];
    if (mapsURL && [[UIApplication sharedApplication] canOpenURL:mapsURL]) {
        //[[UIApplication sharedApplication] openURL:mapsURL options:@{} completionHandler:nil];
    }

    NSURL *vkBaseURL = [NSURL URLWithString:@"VK://"];
    [[UIApplication sharedApplication] openURL:vkBaseURL options:@{} completionHandler:nil];
}

- (NSURL *)mrutils_URLByAppendingQueryItems:(NSURL*)url items:(NSArray<NSURLQueryItem *> *)queryItems {
    NSURLComponents *URLComponents = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    if (!URLComponents) {
        return nil;
    }
    URLComponents.queryItems = [URLComponents.queryItems arrayByAddingObjectsFromArray:queryItems] ?: queryItems;

    return URLComponents.URL;
}

@end
