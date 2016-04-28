//
//  ViewController.m
//  工具类
//
//  Created by 宇宙执政 on 15/10/22.
//  Copyright © 2015年 chenMH. All rights reserved.
//

#import "ViewController.h"
#import "Base64.h"
#import "JoDes.h"
#import "NSString+Hashing.h"
#import "AttributedLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AttributedLabel *label = [[AttributedLabel alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
    label.text = @"hello world";
    [label setFont:[UIFont systemFontOfSize:12] fromIndex:0 length:6];
     [label setFont:[UIFont systemFontOfSize:18] fromIndex:0 length:3];
    [label setColor:[UIColor redColor] fromIndex:0 length:3];
    
    
    [self.view addSubview:label];
    
}


-(void)test1{
    
    /*base64编码解码*/
    NSString *pas = @"12345";
    NSString *base64Encode = [pas base64EncodedString];
    NSLog(@"base64编码 = %@",base64Encode);
    NSString *base64Decoded = [base64Encode base64DecodedString];
    NSLog(@"base64解码 = %@ \n\n\n",base64Decoded);
    
    
    /**JoDes加密，解密*/
    NSString *joDesEncode = [JoDes encode:pas key:@"66BF8DDA"];
    NSString *joDesDe = [JoDes decode:joDesEncode key:@"66BF8DDA"];
    
    NSLog(@"JoDes-加密 = %@",joDesEncode);
    NSLog(@"JoDes-解密 = %@",joDesDe);
    
    
    
    /*MD5加密**/
    NSString *pasword = @"12345";
    NSString *pasMd5 = [pasword MD5Hash];
    NSLog(@"pasMd5 = %@",pasMd5);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
