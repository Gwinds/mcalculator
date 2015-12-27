//
//  ViewController.m
//  计算器
//
//  Created by doubi on 15/12/26.
//  Copyright (c) 2015年 doubi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIButton *btn;
    UILabel *label;
    double a,b,sum;
    
    int count;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    CGFloat width;
    //starty,
     // starty=(self.view.frame.size.height-167-4*width)/2;
   // starty=(self.view.frame.size.height-460);
    width=(self.view.frame.size.width/4);
    label =[[UILabel alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, (self.view.frame.size.height-(4+1)*width))];
    label.backgroundColor=[UIColor blackColor];
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont boldSystemFontOfSize:35];
    label.text=@"";
    label.adjustsFontSizeToFitWidth=YES;
    [label setTextAlignment:(NSTextAlignmentRight)];
    
    [self.view addSubview:label];

    NSMutableArray *marr=[NSMutableArray arrayWithCapacity:100];
    NSArray *mar=@[@"0",@" ",@".",@"=",@"1",@"2",@"3",@"+",@"4",@"5",@"6",@"-",@"7",@"8",@"9",@"x",@"c",@"+/-",@"%",@"÷"];
    
    
    int i,j;
    for(i=0;i<5;i++)
    {
    
        for(j=0;j<4;j++)
        {
          
            
            btn=[UIButton buttonWithType:(UIButtonTypeCustom)];
           // btn.frame=CGRectMake(j*self.view.frame.size.width/4, i*self.view.frame.size.width/4-1, self.view.frame.size.width/4-1, self.view.frame.size.width/4-1);
            btn.frame=CGRectMake(j*width, self.view.frame.size.height-(i+1)*width, width-1, width-1);
           
            if (j==3)
            {
                btn.backgroundColor=[UIColor orangeColor];
                [btn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
                
            }
            else
            {
            btn.backgroundColor=[UIColor colorWithRed:217/255.0 green:218/255.0 blue:220/255.0 alpha:0.8];
            [btn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            }

            [marr addObject:btn];
            [self.view addSubview:btn];
        }
        
      
    }
    for(i=0;i<mar.count;i++)
    {
    [[marr objectAtIndex:i] setTitle:[mar objectAtIndex:i] forState:UIControlStateNormal];
        
    }
    for(i=0;i<marr.count;i++)
    {
    
    [[marr objectAtIndex:i] addTarget:self action:@selector(Calculate:) forControlEvents:UIControlEventTouchDown];
    }
    
    
}
-(void)Calculate:(UIButton*)sender
{
    
    if ([sender.titleLabel.text isEqualToString:@"+"]) {
        count=0;
        a=label.text.intValue;
        label.text=@"";
        
    }
    else if([sender.titleLabel.text isEqualToString:@"-"])
    {   count=1;
        a=label.text.intValue;
        label.text=@"";
    
    }
    else if([sender.titleLabel.text isEqualToString:@"x"])
    {
        count=2;
        a=label.text.intValue;
        label.text=@"";
    }
    else if ([sender.titleLabel.text isEqualToString:@"÷"])
    {   count=3;
        a=label.text.intValue;
        label.text=@"";
    }
    else if([sender.titleLabel.text isEqualToString:@"c"])
    {
         count=4;
         label.text=@"";
    
    }
    else if ([sender.titleLabel.text isEqualToString:@"%"])
    {
    
        count=5;
        a=label.text.intValue;
        label.text=@"";
    
    }
    else if ([sender.titleLabel.text isEqualToString:@"="])
    {
        b=label.text.intValue;
        switch (count) {
            case 0:
                
                sum=a+b;
                label.text=[NSString stringWithFormat:@"%0.1f",sum];                break;
            case 1:
             
                sum=a-b;
                label.text=[NSString stringWithFormat:@"%0.1f",sum];
                break;
            case 2:
              
                sum=a*b;
                label.text=[NSString stringWithFormat:@"%0.1f",sum];
                break;
            case 3 :
               
                sum=a/b;
                label.text=[NSString stringWithFormat:@"%0.1f",sum];
                break;
            case 4:
                label.text=@"";
                break;
            case 5:
                  ;
                  sum=a/100;
                label.text=[NSString stringWithFormat:@"%0.2f",sum];
                break;

            
          default:
               break;
        }
    
    }
    
    else
    {
 
    label.text=[label.text stringByAppendingString:((UIButton *)sender).titleLabel.text];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
