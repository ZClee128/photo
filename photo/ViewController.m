//
//  ViewController.m
//  photo
//
//  Created by lee on 16/5/15.
//  Copyright © 2016年 lee. All rights reserved.
//

#import "ViewController.h"
#import "Coust.h"
@interface ViewController ()
{
    NSMutableArray *arrM3;
    NSMutableArray *arrM2;
    NSMutableArray *arrM;
    Coust *imageV;
    BOOL isEnding;
    CGRect frame;
    UIBarButtonItem *b;
    UILabel *label;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    label.text = @"点击排版";
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:label];
    label.userInteractionEnabled = YES;
    self.navigationItem.titleView = label;
    arrM = [NSMutableArray arrayWithArray:@[@"psb0.jpg",@"psb1.jpg",@"psb2.jpg",@"psb3.jpg",@"psb4.jpg",@"psb5.jpg",@"psb6.jpg",@"psb7.jpg",@"psb8.jpg",@"psb9.jpg",@"psb10.jpg",@"psb11.jpg",@"psb12.jpg",@"psb13.jpg",@"psb14.jpg",@"psb15.jpg"]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [label addGestureRecognizer:tap];
    b = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(tap1:)];
    self.navigationItem.rightBarButtonItem = b;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 623, self.view.frame.size.width, 44);
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"点击删除" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    isEnding = NO;
    
    
    
}




- (void)Click:(UIButton *)sender
{
    //    NSInteger line = 0;
    //    NSInteger arrange = 0;
    //    for (NSInteger i = 0; i < arrM2.count; i++) {
    //
    //            if ([arrM2[i] isSelected]) {
    //                [arrM2[i] removeFromSuperview];
    //                [arrM2 removeObject:arrM2[i]];
    ////                NSLog(@"%ld",arrM2.count);
    //            }
    //        line = i / 4;
    //
    //         Coust *imageView1 = arrM2[i];
    //        [Coust animateWithDuration:0.5 animations:^{
    //            imageView1.frame = CGRectMake(10 + arrange * 91, 80 + line * 91, 81, 81);
    //        }];
    //        arrange++;
    //        if (arrange == 4) {
    //            arrange = 0;
    //        }
    //
    //    }
    NSInteger line = 0;
    NSInteger arrange = 0;
    
    for (NSInteger i = 0 ; i < arrM2.count; i++) {
        Coust *imageV1 = arrM2[i];
        [imageV1 removeFromSuperview];
    }
    [arrM2 removeObjectsInArray:arrM3];
    for (NSInteger j = 0; j < arrM2.count; j++) {
        line = j / 4;
        
        Coust *imageView = arrM2[j];
        [Coust animateWithDuration:0.5 animations:^{
            imageView.frame = CGRectMake(10 + arrange * 91, 80 + line * 91, 81, 81);
        }];
        arrange++;
        if (arrange == 4) {
            arrange = 0;
        }
        Coust *img = arrM2[j];
        [self.view addSubview:img];
    }
    
    
    
    
    
    
    
    
}


- (void)tap:(UITapGestureRecognizer *)tap
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-108)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    if (arrM.count == 0) {
        return;
    }
    arrM2 =[[NSMutableArray alloc]init];
    NSInteger num = arc4random()%arrM.count+1;
    NSInteger count = 0;
    for (NSInteger i = 0; i < num/4; i++) {
        for (NSInteger j = 0; j<4 ; j++) {
            imageV = [[Coust alloc]initWithFrame:CGRectMake(10+j*91, 80+i*91, 81, 81)];
            imageV.image = [UIImage imageNamed:arrM[count]];
            [self.view addSubview:imageV];
            count ++;
            imageV.userInteractionEnabled = YES;
            
            UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2:)];
            [imageV addGestureRecognizer:tap1];
            
            [arrM2 addObject:imageV];
            
            
            
        }
    }
    for (NSInteger i = 0 ; i < num%4; i++) {
        imageV = [[Coust alloc]initWithFrame:CGRectMake(10+i*91, 80+(num/4)*91, 81, 81)];
        imageV.image = [UIImage imageNamed:arrM[count]];
        [self.view addSubview:imageV];
        count ++;
        imageV.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2:)];
        [imageV addGestureRecognizer:tap1];
        [arrM2 addObject:imageV];
    }
    
}


- (void)tap1:(UIBarButtonItem *)sender
{
    
    if ([b.title  isEqual: @"Edit"]) {
        b.title = @"Done";
        b.style = UIBarButtonItemStyleDone;
        label.userInteractionEnabled = NO;
        arrM3 = [[NSMutableArray alloc]init];
        for (NSInteger i = 0; i<arrM2.count; i++) {
            UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap3:)];
            
            [arrM2[i] addGestureRecognizer:tap2];
            //            if ([arrM2[i] isSelected]) {
            //                [arrM3 addObject:arrM2];
            //            }
        }
        
    }else
    {
        b.title = @"Edit";
        b.style =UIBarButtonItemStylePlain;
        imageV.isSelected = NO;
        label.userInteractionEnabled = YES;
        for (NSInteger i = 0; i<arrM2.count; i++) {
            UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2:)];
            
            [arrM2[i] addGestureRecognizer:tap1];
        }
    }
    //    UIBarButtonItem *t1 = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(item:)];
    //    self.navigationItem.rightBarButtonItem = t1;
    //    UIBarButtonItem  *t =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(item:)];
    //    self.navigationItem.rightBarButtonItem = t;
    //        UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap3:)];
    //        [imageV addGestureRecognizer:tap2];
    
    
}

- (void)tap2:(UITapGestureRecognizer *)tap
{
    UIImageView *v = (UIImageView *)tap.view;
    
    if (isEnding == NO) {
        
        frame = v.frame;
        [UIView animateWithDuration:1 animations:^{
            self.navigationController.navigationBarHidden = YES;
            v.frame = self.view.bounds;
            [self.view bringSubviewToFront:v];
        }];
        isEnding = YES;
    }else{
        //缩小变回原来的位置；
        //需要先知道原来的位置是什么
        [UIView animateWithDuration:1 animations:^{
            self.navigationController.navigationBarHidden = NO;
            v.frame = frame;
        }];
        isEnding = NO;
    }
}

- (void)tap3:(UITapGestureRecognizer *)tap
{
    Coust *v1 = (Coust *)tap.view;
    v1.isSelected = !v1.isSelected;
    [arrM3 addObject:tap.view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

