//
//  peaceDetailViewController.m
//  NaviBarHideShow
//
//  Created by zhaoyp on 12/5/12.
//  Copyright (c) 2012 zhaoyp. All rights reserved.
//

#import "peaceDetailViewController.h"
#import "peaceHideBarViewController.h"

@interface peaceDetailViewController ()
- (IBAction)showHideVC:(id)sender;
- (void)configureView;
@end

@implementation peaceDetailViewController

- (void)dealloc
{
    [_detailItem release];
    [_detailDescriptionLabel release];
    [super dealloc];
}


- (IBAction)showHideVC:(id)sender
{
    peaceHideBarViewController* sbvc = [[peaceHideBarViewController alloc] initWithNibName:@"peaceHideBarViewController" bundle:nil];
    [self.navigationController pushViewController:sbvc animated:YES];
    [sbvc release];
}
#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];

        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
@end
