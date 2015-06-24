//
//  UITextView+nl_PlaceHolder.h
//  jobsradar
//
//  Created by nathan@hoomic.com on 15/5/19.
//  Copyright (c) 2015年 Hoomic. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  @brief  给UITextView加上占位符
 */
@interface UITextView (nl_Placeholder)

@property (strong, nonatomic) NSString *nl_placeholder;      // 占位符文字
@property (strong, nonatomic) UIColor  *nl_placeholderColor; // 占位符颜色
@property (strong, nonatomic) UIFont   *nl_placeholderFont;  // 占位符字体


/**
 *  @brief  默认为NO。
 *          UITextView中手动更改text（即：textView.text = text）时，不会主动
 *       发送UITextViewTextDidChangeNotification通知。该通知只有在用户界面上
 *       输入文字时才会发送。本属性如果设置为YES的话，在textView.text = text时，
 *       也主动触发该通知；否则不触发。
 */
@property (assign, nonatomic) BOOL nl_isDidChangePostNotification;

@end
