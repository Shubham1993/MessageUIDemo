//
//  ViewController.m
//  EmailSender
//
//  Created by Shubham on 01/05/17.
//  Copyright © 2017 Shubham. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    MFMailComposeViewController* mailComposeViewController;
    MFMessageComposeViewController *messageComposeViewController;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sendEMail:(id)sender {
    
    if (![MFMailComposeViewController canSendMail]) {
        NSLog(@"Can not send Email");
    }else{
        
        mailComposeViewController = [[MFMailComposeViewController alloc] init];
        mailComposeViewController.mailComposeDelegate = self;
        [self presentViewController:mailComposeViewController animated:YES completion:nil];
    }
    
}
- (IBAction)sendMessage:(id)sender {
    
    if (![MFMessageComposeViewController canSendText]) {
        NSLog(@"Can not send message");
    }else{
        messageComposeViewController = [[MFMessageComposeViewController alloc] init];
        messageComposeViewController.messageComposeDelegate = self;
        [self presentViewController:messageComposeViewController animated:YES completion:nil];
    }
}


-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    if (error) {
        NSLog(@"failed to send mail");
    }
    [mailComposeViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    
    [messageComposeViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
