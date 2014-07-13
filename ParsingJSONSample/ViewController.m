//
//  ViewController.m
//  ParsingJSONSample
//
//  Created by Anusha Tondapu on 13/07/14.
//
//

#import "ViewController.h"
#import "JSONHelper.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize txtSampleText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnConvertToMD5:(UIButton *)sender {
    NSString *url = @"http://md5.jsontest.com/?text=";
    [url stringByAppendingString:self.txtSampleText.text];
    
    NSDictionary *responseData = [JSONHelper parseJsonResponse:url];
    if (responseData) {
        NSString *md5Text = [responseData valueForKey:@"md5"];
        NSString *popupText = [NSString stringWithFormat:@"Md5 of %@ is %@", self.txtSampleText.text, md5Text];
        UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"MD5 Text" message:popupText delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertMessage show];
        [self.txtSampleText resignFirstResponder];
        self.txtSampleText.text = @"";
    }
    else
    {
        UIAlertView *error = [[UIAlertView alloc]initWithTitle:@"Error" message:@"No data received from server" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [error show];
        [self.txtSampleText resignFirstResponder];
        self.txtSampleText.text = @"";
    }
}


@end
