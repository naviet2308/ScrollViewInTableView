//
//  ViewController.m
//  ScrollViewInTableView
//
//  Created by NAV on 7/10/15.
//  Copyright (c) 2015 RedGao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *imageArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Demo";
    self.imageArr = [NSArray arrayWithObjects:@"image1",@"image2",@"image3",@"image4",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellScroll"];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    for(NSInteger i = 0; i < self.imageArr.count ; i++){
        UIImage *image = [UIImage imageNamed:[self.imageArr objectAtIndex:i]];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.frame = CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, 200);
        [scrollView addSubview:imageView];
    }
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width * self.imageArr.count, 200);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator=NO;
    [cell addSubview:scrollView];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

@end
