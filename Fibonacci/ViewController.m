//
//  ViewController.m
//  Fibonacci
//
//  Created by Matsumoto Taichi on 4/7/15.
//  Copyright (c) 2015 iHeartMedia. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"NumberCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", [self fibonacci:indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 92;
}


-(NSInteger)fibonacci:(NSUInteger) n{
    
    if (n < 2) {
        return 1;
    }
    
    NSUInteger f1 = 1;
    NSUInteger f2 = 1;
    
    for(int i=2;i<=n;i++) {
        NSUInteger current = f1 + f2;
        f1 = f2;
        f2 = current;
    }
    
    return f2;
}

@end
