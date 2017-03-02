//
//  addNewItemViewController.m
//  hw2_Inventor
//
//  Created by Ally Han on 3/1/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "addNewItemViewController.h"

@interface addNewItemViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *addTitle;
@property (weak, nonatomic) IBOutlet UITextField *itemName;
@property (weak, nonatomic) IBOutlet UITextField *itemPrice;
@property (weak, nonatomic) IBOutlet UILabel *stockLabel;
@property (weak, nonatomic) IBOutlet UITextField *stockNum;
@property (weak, nonatomic) IBOutlet UITextView *Des;
@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation addNewItemViewController

- (IBAction)addButtonTapped:(id)sender {
    if(self.itemPrice.text != nil && self.itemName.text != nil && self.Des.text != nil && self.stockNum != nil){
        int numberInStock = [self.stockNum.text intValue];
        NSString *theprice = @"$";
        theprice = [theprice stringByAppendingString:self.itemPrice.text];
        [self.shopViewController addNewItemWithInfo:self.itemName.text andDescription:self.Des.text andNumber:numberInStock andPrice:theprice];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Des.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    if([textView.text isEqualToString:@"Describe your item here!"]){
        textView.text = @"";
    }
    
    return YES;
}


@end
