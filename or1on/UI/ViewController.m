//
//  ViewController.m
//  or1on
//
//  Created by Rayyan Khan on 21/06/2026.
//

#import "ViewController.h"
#import "../Exploit/or1on.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UIButton* startButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    [self setupUI];
}

- (void)setupUI {
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.text = @"or1on";
    self.titleLabel.font = [UIFont boldSystemFontOfSize:36.0];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor labelColor];
    [self.view addSubview:self.titleLabel];

    self.startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.startButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    [self.startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.startButton.titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
    self.startButton.backgroundColor = [UIColor systemRedColor];
    self.startButton.layer.cornerRadius = 12.0;
    self.startButton.clipsToBounds = YES;
    [self.startButton addTarget:self action:@selector(runExploit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startButton];

    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-60],

        [self.startButton.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:24],
        [self.startButton.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.startButton.widthAnchor constraintEqualToConstant:180],
        [self.startButton.heightAnchor constraintEqualToConstant:50]
    ]];
}

- (void)runExploit {
    self.startButton.enabled = NO;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        or1on_init();
        or1on_deinit();
        printf("[*] All done\n");
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.startButton setTitle:@"Done" forState:UIControlStateNormal];
            self.startButton.backgroundColor = [UIColor systemGreenColor];
        });
    });
}

@end
