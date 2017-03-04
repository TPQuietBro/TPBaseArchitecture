//
//  CSSHomeView.h
//  YYZN
//
//  Created by CCPG_iOS on 2017/2/16.
//  Copyright © 2017年 ccpg_it. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YYZNLoginDelegate <NSObject>

- (void)doLoginBy:(NSDictionary *)userInfoDic;

@end

@interface CSSHomeView : UIView<UITextFieldDelegate>

@property (nonatomic , weak) id<YYZNLoginDelegate> delegate;

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *password;
@property (nonatomic,strong) NSString *memerCode;

@end
