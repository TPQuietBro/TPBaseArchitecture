/**
 
 ***************************************************************************************
 * 创建者  ：信息技术中心
 * 创建时间: 2016年10月19日
 * 创建目的：展示一应生活app主要新功能.
 ***************************************************************************************
 * 更新者 ：
 * 更新时间:
 * 更新内容:
 ***************************************************************************************
 ****************  该文件为深圳一应社区商务集团有限公司版权所有，未经允许不可更改   ****************
 Copyright (C) 2015.  All rights reserved.
 ********************************** 信息技术中心 *****************************************
 
 **/

#import "ZNNewFeatureViewController.h"
#import "UIView+TPFrameExtension.h"

@interface ZNNewFeatureViewController ()<UIScrollViewDelegate>

/**滚动区域*/
@property (nonatomic , strong) UIScrollView *scrollView;
/**保存图片名字*/
@property (nonatomic , strong) NSArray *imageArray;
/**选择的按钮*/
@property (nonatomic , strong) UIButton *enterCommButton;

@end

@implementation ZNNewFeatureViewController

#pragma mark - life cycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //界面即将显示的时候隐藏状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:TRUE];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    //界面消失的时候显示状态栏
    [[UIApplication sharedApplication] setStatusBarHidden:false];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
   
    //创建滚动的界面
    [self createScrollView];
    
    //创建显示图片的界面
    [self createImageView];
    
}

#pragma mark - init methods
/*
 * 横向滚动界面
 */
- (void)createScrollView{
    [self.view addSubview:self.scrollView];
}
/*
 * 显示图片的界面
 */
- (void)createImageView{
    for (int i = 0; i < self.imageArray.count; ++i) {
        
        //创建图片view
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * [UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        [self.scrollView addSubview:imageView];
        
        /**引导页大图不宜放入asserts中,会增加缓存,所以放到外部工程文件中,通过imageWithContentsOfFile来读取,不会增加缓存**/
        //通过bundle取出图片,不会加入缓存
        NSString *path = [[NSBundle mainBundle] pathForResource:self.imageArray[i] ofType:@"png"];
        imageView.image = [UIImage imageWithContentsOfFile:path];

        //点击按钮进入选择小区界面
        if (i == self.imageArray.count - 1) {
            imageView.userInteractionEnabled = YES;
            [imageView addSubview:self.enterCommButton];
        }
    }
}

#pragma mark - event response
/*
 * 根据是否选择小区来确定根控制器
 */
- (void)goToHomeVc{
    

}

#pragma mark - getter/setter
/*
 * 点击选择的按钮
 */
- (UIButton *)enterCommButton{
    if (!_enterCommButton) {
        _enterCommButton = [[UIButton alloc]init];
        [_enterCommButton setTitle:@"进去" forState:UIControlStateNormal];
        [_enterCommButton addTarget:self action:@selector(enterBtClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _enterCommButton;
}


- (void)enterBtClick{
    
}

/*
 * 滚动区域
 */
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = self.view.bounds;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(EW_ScreenW * self.imageArray.count, 0);
    }
    return _scrollView;
}

/*
 * 图片名的数组
 */
- (NSArray *)imageArray{
    if (!_imageArray) {
        NSArray *imageArray = @[@"1",@"2",@"3",@"4"];
        _imageArray = imageArray;
    }
    return _imageArray;
}

@end
