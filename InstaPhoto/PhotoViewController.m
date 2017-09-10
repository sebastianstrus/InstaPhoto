//
//  PhptoViewController.m
//  InstaPhoto
//
//  Created by Sebastian Strus on 2017-09-09.
//  Copyright © 2017 Sebastian Strus. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.imageFileName]];
    imageView.frame = CGRectMake(30, 80, 300, 300);
    
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
