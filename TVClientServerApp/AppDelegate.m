//
//  AppDelegate.m
//  TVClientServerApp
//
//  Created by Peng on 9/11/15.
//  Copyright © 2015 Peng. All rights reserved.
//

#import "AppDelegate.h"
#import <TVMLKit/TVMLKit.h>

@interface AppDelegate () <TVApplicationControllerDelegate>

@property (nonatomic) TVApplicationController *controller;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // create context
    TVApplicationControllerContext *context = [[TVApplicationControllerContext alloc] init];
    
    // main Javascript file url
    NSURL *url = [NSURL URLWithString:@"https://db.tt/Y5Aup5w9"];
    context.javaScriptApplicationURL = url;
    
    // transfer options to Javascript context, we can get these options in App.onLaunch
    // we can also define our own key/values
    if (launchOptions) {
        NSMutableDictionary *options = [NSMutableDictionary dictionary];
        [launchOptions enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            options[(NSString *)key] = obj;
        }];
        context.launchOptions = [options copy];
    }
    
    // create controller
    self.controller = [[TVApplicationController alloc] initWithContext:context window:self.window delegate:self];
    
    return YES;
}

#pragma TVApplicationControllerDelegate

- (void)appController:(TVApplicationController *)appController didFinishLaunchingWithOptions:(NSDictionary<NSString *,id> *)options
{
    NSLog(@"did Finish Launching");
}

- (void)appController:(TVApplicationController *)appController didFailWithError:(NSError *)error
{
    NSLog(@"did Fail With Error : %@", error);
}

- (void)appController:(TVApplicationController *)appController didStopWithOptions:(NSDictionary<NSString *,id> *)options
{
     NSLog(@"did Stop");
}

@end
