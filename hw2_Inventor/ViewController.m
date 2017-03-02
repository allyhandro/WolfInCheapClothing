//
//  ViewController.m
//  hw2_Inventor
//
//  Created by Ally Han on 2/28/17.
//  Copyright © 2017 nyu.edu. All rights reserved.
//

#import "ViewController.h"
#import "ObjectInfo.h"
#import "addNewItemViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UILabel *ProductName;
@property (weak, nonatomic) IBOutlet UILabel *Price;
@property (weak, nonatomic) IBOutlet UILabel *StockNum;
@property (weak, nonatomic) IBOutlet UILabel *ProductDesc;

@property (weak, nonatomic) IBOutlet UIImageView *ProductImg;

@property (weak, nonatomic) IBOutlet UIButton *stockInc;
@property (weak, nonatomic) IBOutlet UIButton *stockDec;
@property (weak, nonatomic) IBOutlet UIButton *nextItem;
@property (weak, nonatomic) IBOutlet UIButton *prevItem;

@property (weak, nonatomic) IBOutlet UIButton *addItem;

-(IBAction)incrementArray:(id)sender;
-(IBAction)decrementArray:(id)sender;
-(IBAction)incrementStock:(id)sender;
-(IBAction)decrementStock:(id)sender;

@end

@implementation ViewController{
    int index;
    NSMutableArray *store;
    ObjectInfo *current;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    store = [[NSMutableArray alloc] init];
    current = [[ObjectInfo alloc] init];
    [self initStore];
    index = 0;
    // view store
    [self updateView];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)incrementArray:(id)sender{
    index = index + 1;
    
    if(index == [store count]){
        self.nextItem.enabled = NO;
    }else{
        self.nextItem.enabled = YES;
    }

    [self updateView];
}
-(IBAction)decrementArray:(id)sender{
    index = index - 1;
    if(index == 0){
        self.prevItem.enabled = NO;
    }else{
        self.prevItem.enabled = YES;
    }
    [self updateView];
    
}
-(IBAction)incrementStock:(id)sender{
    [current incNumOnHand];
    [self updateView];
    
}
-(IBAction)decrementStock:(id)sender{
    if ([current numOnHand] != 0){
        [current decNumOnHand];
    }
    [self updateView];
}

-(void) updateView{
    current = store[index];
    self.ProductName.text = [current name];
    self.Price.text = [current price];
    self.ProductDesc.text = [current description];
    self.ProductImg.image = [UIImage imageNamed: [current imageName]];
    self.StockNum.text = [NSString stringWithFormat:@"%d", [current numOnHand]];
    
    if(index == 0){
        self.prevItem.enabled = NO;
        self.prevItem.alpha = 0.2;
    }else{
        self.prevItem.enabled = YES;
        self.prevItem.alpha = 1.0;
    }
    
    if (index + 1 == [store count]){
        self.nextItem.enabled = NO;
        self.nextItem.alpha = 0.2;
    } else{
        self.nextItem.enabled = YES;
        self.nextItem.alpha = 1.0;
    }
    
    if([current numOnHand] == 0){
        self.stockDec.enabled = NO;
        self.stockDec.alpha = 0.2;
    }else {
        self.stockDec.enabled = YES;
        self.stockDec.alpha = 1.0;
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    addNewItemViewController *addItem = segue.destinationViewController;
    addItem.shopViewController = self;
}

-(void) initStore{
    ObjectInfo *NautiBuoy = [[ObjectInfo alloc] init];
    [NautiBuoy setInfo: @"Nauti Boy" andDescription:@"Your fluffable friend will look sporting in this Nautical Inspired Look! Perfect for those afternoon playdates on your friends yacht." andNumOnHand:10 andImageName:@"1.png" andPrice:@"$25.67"];
    [store addObject:NautiBuoy];
    
    ObjectInfo *OverPaws = [[ObjectInfo alloc] init];
    [OverPaws setInfo: @"Over-Paws" andDescription:@"Time to get cool and comfy in this perfect jumper for your jumpy pal. Over-Paws are the perfect outfit for family picnics and other summertime fun. Extra pockets add extra space for tail wagging fun!" andNumOnHand:12 andImageName:@"2.png" andPrice:@"$22.34"];
    [store addObject:OverPaws];
    
    ObjectInfo *RufflePuff = [[ObjectInfo alloc] init];
    [RufflePuff setInfo: @"Ruffle Puff Jacket" andDescription:@"Keep your princess or non-gender normative prince warm AND stylish in this royal number. Water resistant and styled by the most famous dog apperal designer, Phil, your special friend is sure to leave other dogs ruffled with jealousy." andNumOnHand:5 andImageName:@"3.png" andPrice:@"$48.62"];
    [store addObject:RufflePuff];
    
    ObjectInfo *Hound = [[ObjectInfo alloc] init];
    [Hound setInfo: @"Hound of Baskerville Jacket" andDescription:@"Who better to share your love of Sherlock Holmes than your very own partner in crime? This classic stylish look keeps your dog looking smart while keeping others guessing what you'll dress your dog in next! Often bought in conjuction with the Baskerville Cap, Sherlock's hat for dogs." andNumOnHand:12 andImageName:@"4.png" andPrice:@"$37.84"];
    [store addObject:Hound];
    
    ObjectInfo *CollieFlower = [[ObjectInfo alloc] init];
    [CollieFlower setInfo: @"Collie Flower Dress" andDescription:@"Only for the most elegant of pups, this dress will make your princess the belle of the ball. Soft chiffon ruffles are flattering on any body type or size! Perfect for those semi-formal spring shin-digs!" andNumOnHand:12 andImageName:@"5.png" andPrice:@"$22.34"];
    [store addObject:CollieFlower];
    
    NSLog(@"%@", [[store objectAtIndex:0] name]);
}

-(void) addNewItemWithInfo:(NSString *) info andDescription:(NSString *)description andNumber:(int)number andPrice:(NSString *)price{
    
    ObjectInfo *newObject = [[ObjectInfo alloc] init];
    [newObject setInfo: info andDescription:description andNumOnHand:number andImageName:@"imageUnavailable.png" andPrice:price];
    [store addObject:newObject];
    [self updateView];
    
    
}



@end
