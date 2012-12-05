//
//  peaceHideBarViewController.m
//  NaviBarHideShow
//
//  Created by zhaoyp on 12/5/12.
//  Copyright (c) 2012 zhaoyp. All rights reserved.
//

#import "peaceHideBarViewController.h"
#import "peaceShowNavBarViewController.h"

@interface peaceHideBarViewController ()
{
    NSInteger showVCCount;
    BOOL showNavBar;
}
- (IBAction)showHideVC:(id)sender;

- (IBAction)backBtnPressed:(id)sender;
@end

@implementation peaceHideBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    showVCCount = [[self.navigationController viewControllers] count];
    showNavBar = !self.navigationController.navigationBarHidden;
    if(showNavBar)
    {
 
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    int count = [[self.navigationController viewControllers] count];
    if(count<showVCCount)
    {//pop
        NSLog(@"pop...");
    }
    else if(count>showVCCount)
    {//push
         NSLog(@"push...");
    }
    if(showNavBar)
    {
               [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showHideVC:(id)sender
{
    peaceShowNavBarViewController* sbvc = [[peaceShowNavBarViewController alloc] initWithNibName:@"peaceShowNavBarViewController" bundle:nil];
    [self.navigationController pushViewController:sbvc animated:YES];
    [sbvc release];
}

- (IBAction)backBtnPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
