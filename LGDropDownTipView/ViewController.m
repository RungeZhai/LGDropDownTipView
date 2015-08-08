//
//  ViewController.m
//  LGDropDownTipView
//
//  Created by liuge on 8/7/15.
//  Copyright (c) 2015 ZiXuWuYou. All rights reserved.
//

#import "ViewController.h"
#import "LGDropDownTipView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *referenceView0;
@property (weak, nonatomic) IBOutlet UIView *referenceView1;
@property (weak, nonatomic) IBOutlet UIView *referenceView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)didClickShow:(id)sender {
    int random0 = arc4random_uniform(5);
    int random1 = arc4random_uniform(5);
    int random2 = arc4random_uniform(5);
    int random3 = arc4random_uniform(5);
    
    [LGDropDownTipView showMessage:[NSString stringWithFormat:@"Random Message %d", random0]
                     referenceView:self.navigationController.navigationBar];
    
    [LGDropDownTipView showMessage:[NSString stringWithFormat:@"Random Message %d", random1]
                     referenceView:_referenceView0];
    
    [LGDropDownTipView showMessage:[NSString stringWithFormat:@"Random Message %d", random2]
                     referenceView:_referenceView1];
    
    [LGDropDownTipView showMessage:[NSString stringWithFormat:@"A Very Long Random Message %d", random3]
                     referenceView:_referenceView2];
}


@end
