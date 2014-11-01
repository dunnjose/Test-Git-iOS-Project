//
//  JDViewController.m
//  Git Test
//
//  Created by Dunn, Joseph on 10/26/14.
//  Copyright (c) 2014 com.merck. All rights reserved.
//

#import "JDViewController.h"

@interface JDViewController ()
@property (strong, nonatomic) IBOutlet JDView *jdView;
@property (strong, nonatomic) IBOutlet UILabel *merck;


@end

@implementation JDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  self.jdView.newmerck = self.merck;
    
    }
- (IBAction)changeColor:(UISegmentedControl *)sender {
    
    if (sender.selectedSegmentIndex == 0) {
    self.merck.textColor = [UIColor greenColor];
    } else {
        self.merck.textColor = [UIColor blueColor];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
