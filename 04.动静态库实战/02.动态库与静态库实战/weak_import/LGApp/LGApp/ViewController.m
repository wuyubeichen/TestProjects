//
//  ViewController.m
//  LGApp
//
//  Created by ws on 2021/1/25.
//

#import "ViewController.h"
#import <SYTimer.h>
#import <LGFramework/LGFramework.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SYTimer *timer = [SYTimer new];
    NSLog(@"%@", timer);
    LGOneObject *object = [LGOneObject new];
    [object testOneObject];
    NSLog(@"%@", object);
}


@end
