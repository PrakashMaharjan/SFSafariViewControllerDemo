//
//  ViewController.m
//  SFSafariViewDemo
//
//  Created by Prakash Maharjan on 2/2/17.
//  Copyright © 2017 Prakash Maharjan. All rights reserved.
//

#import "ViewController.h"

// Import the SafariServices framework
//(before this add frameworks selecting project taget > Linked Frameworks and Libraries > search framework Safari Services > Select SafariServices.Frameworks > Add)
#import <SafariServices/SafariServices.h>


@interface ViewController ()<SFSafariViewControllerDelegate> //set delegate

// create outlet for SFSafariViewController
@property(nonatomic,strong) IBOutlet SFSafariViewController *sfvc;
@property (weak, nonatomic) IBOutlet UIButton *openLinkButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.openLinkButton.layer.cornerRadius = self.openLinkButton.frame.size.height / 2.0;
    self.openLinkButton.layer.borderWidth = 2.0;
    self.openLinkButton.layer.borderColor = [UIColor blueColor].CGColor;
}


- (IBAction)openLink:(id)sender {
    
    //url to open
    NSURL *urlToOpen = [NSURL URLWithString:[NSString stringWithFormat:@"https://google.com"]];
    
    // check SFSafariViewController class available; since SFSafariViewController is available from iOS 9 only.
    if ([SFSafariViewController class] != nil) {
        self.sfvc = [[SFSafariViewController alloc] initWithURL:urlToOpen];
        [self presentViewController:self.sfvc animated:YES completion:nil];
    } else {
        //open in default browser of iphone
    
        [[UIApplication sharedApplication] openURL:urlToOpen options:@{} completionHandler:nil];
    }
}

#pragma mark - SFSafariViewController delegates
- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
