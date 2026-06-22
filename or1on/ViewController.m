//
//  ViewController.m
//  or1on
//
//  Created by Rayyan Khan on 21/06/2026.
//

#import "ViewController.h"
#import "Exploit/exploit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        exploit_init();
        exploit_deinit();
        printf("[*] All done\n");
    });
}


@end
