//
//  ObjectInfo.h
//  hw2_Inventor
//
//  Created by Ally Han on 2/28/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectInfo : NSObject
// Getters
-(NSString *) name;
-(NSString *) description;
-(NSString *) price;
-(int) numOnHand;
-(NSString *) imageName;

// Setters
-(void) setName: (NSString *) n;
-(void) setDescription: (NSString *) des;
-(void) setPrice: (NSString *) p;
-(void) setNumOnHand: (int) onHand;
-(void) setImageName: (NSString *) ImgName;

// Other Methods
-(void) setInfo: (NSString *) n andDescription: (NSString *) desc andNumOnHand: (int) onHand andImageName: (NSString *) imgName andPrice: (NSString *) p;
-(void) decNumOnHand;
-(void) incNumOnHand;
@end
