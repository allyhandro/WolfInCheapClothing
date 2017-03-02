//
//  ObjectInfo.m
//  hw2_Inventor
//
//  Created by Ally Han on 2/28/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "ObjectInfo.h"

@implementation ObjectInfo
{
    NSString *name;
    NSString *description;
    NSString *imageName;
    NSString *price;
    int numOnHand;
}


// Getters
-(NSString *) name {
    return name;
}

-(NSString *) description {
    return description;
}

-(NSString *) price {
    return price;
}

-(NSString *) imageName {
    return imageName;
}

-(int) numOnHand {
    return numOnHand;
}


// Setters
-(void) setName:(NSString *)n {
    name = n;
}

-(void) setDescription: (NSString *) des{
    description = des;
}

-(void) setNumOnHand: (int) onHand{
    numOnHand += onHand;
}

-(void) setImageName:(NSString *)ImgName {
    imageName = ImgName;
}

-(void) setPrice:(NSString *)p {
    price = p;
}

// Other Methods
-(void) decNumOnHand{
    numOnHand = numOnHand - 1;
}

-(void) incNumOnHand{
    numOnHand = numOnHand + 1;
}

-(void)setInfo:(NSString *)n andDescription:(NSString *)desc andNumOnHand:(int)onHand andImageName:(NSString *)imgName andPrice:(NSString *)p{
    name = n;
    description = desc;
    numOnHand = onHand;
    imageName = imgName;
    price = p;
    
}
@end
