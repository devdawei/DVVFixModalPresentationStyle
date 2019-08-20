//
//  ViewController.m
//  DVVFixModalPresentationStyle
//
//  Created by David on 2019/8/20.
//  Copyright © 2019 David. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+DVVFixModalPresentationStyle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)buttonClickAction:(UIButton *)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:NSStringFromClass(ViewController.class)];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
