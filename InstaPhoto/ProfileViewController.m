//
//  ProfileViewController.m
//  InstaPhoto
//
//  Created by Sebastian Strus on 2017-09-08.
//  Copyright © 2017 Sebastian Strus. All rights reserved.
//

#import "ProfileViewController.h"
#import "FavoritesViewController.h"
#import "FeedViewController.h"
#import "AppDelegate.h"
#import "UIImageView+AFNetworking.h"

#import "AFNetworking/AFNetworking.h"
#import "AFHTTPSessionManager.h"
//#import <AFNetworking/AFNetworking.h>

@interface ProfileViewController ()

@end

@implementation ProfileViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nil];
    if (self) {
        self.title = @"Profile";
        self.tabBarItem.image = [UIImage imageNamed:@"profile"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *url = [[NSURL alloc] initWithString:@"https://api.github.com/users/hadley/orgs"];
    NSURLRequest *request= [[NSURLRequest alloc] initWithURL:url];
    
    /*AFJSONRequestOperation *operation = [AFJSONRequestOperation
                                         JSONRequestOperationWithRequest:request
                                         success:NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
                                             
                                         } failure:(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
                                             NSLog(@"NSError: %@", error.localizedDescription);
                                         }];
    [operation start];*/
                                         
                                         
                                         
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:[url absoluteString]
      parameters:nil
         success:^(NSURLSessionDataTask *task, id responseObject) {
             NSLog(@"JSON: %@", responseObject);
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             // Handle failure
             NSLog(@"NSError: %@", error.localizedDescription);
         }];
    
    
    
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    self.scrollView.contentSize = CGSizeMake(375, 770);
    [self.view addSubview:self.scrollView];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    
    //ADD IMAGE
    UIImageView *imageView = [[UIImageView alloc] init];// initWithImage: [UIImage imageNamed: @"seb"]];
    //[sebView setContentMode:UIViewContentModeScaleToFill];
    //sebView.frame = self.view.frame;
    imageView.frame = CGRectMake(20, 20, 100, 114);
    [imageView setImageWithURL: [NSURL URLWithString:@"https://sebastianstrus.github.io/images/sebastian.png"]
              placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    [self.scrollView addSubview:imageView];
    
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 220, 280, 40)];
    nameLabel.text = @"Name: Sebastian Strus";
    [self.scrollView addSubview:nameLabel];
    
    UILabel *cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 280, 280, 40)];
    cityLabel.text = @"Warsaw";
    [self.scrollView addSubview:cityLabel];
    
    UITextView *biography = [[UITextView alloc] initWithFrame:CGRectMake(20, 340, 300, 330)];
    biography.font = [UIFont fontWithName:@"Helvetica" size:15];
    biography.editable = NO;
    biography.text = @"Låter dig sätta en timer som automatiskt aktiverar ett larm när tidsperioden har passerat. Detta är lämpligt för dig som i förväg vet att du tillfälligt kommer att vara utsatt för en situation med förhöjd risk. När du aktiverar timern ges du även möjlighet att med text beskriva situationen och platsen. Skulle ett larm aktiveras skickas informationen till larmmottagarna. Timer alarmet kommer att aktiveras även om telefonen har slut på batteri eller av annan anledning stängas av under nedräkningen. I det fallet kommer istället Alertys servrar att automatiskt skicka larmet till dina larmmottagare och ange din senast kända position.";
    [self.scrollView addSubview:biography];
    
    UILabel *memberSinceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 670, 280, 40)];
    memberSinceLabel.text = @"September 2017";
    [self.scrollView addSubview:memberSinceLabel];
    
    UIButton *favoritesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    favoritesButton.frame = CGRectMake(200, 50, 150, 44);
    [favoritesButton setTitle:@"View Favorites" forState:UIControlStateNormal];
    [self.scrollView addSubview:favoritesButton];
    [favoritesButton addTarget: self action:@selector(showFavorites:)
              forControlEvents:UIControlEventTouchUpInside];
}

- (void) showFavorites:(UIButton *) sender {
    FavoritesViewController * favoritesViewController = [[FavoritesViewController alloc] init];
    NSLog(@"Trying to move to Favorites");
    [self.navigationController pushViewController:favoritesViewController animated:YES];
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
