//
//  ViewController.h
//  hw2_Inventor
//
//  Created by Ally Han on 2/28/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>



-(void) addNewItemWithInfo:(NSString *) info andDescription:(NSString *)description andNumber:(int)number andPrice:(NSString *)price;


@end

