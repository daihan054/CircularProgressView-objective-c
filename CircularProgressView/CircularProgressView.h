#import <UIKit/UIKit.h>

@interface CircularProgressView : UIView

- (instancetype)initWithCenter:(CGPoint)center radius:(CGFloat)radius lineWidth:(CGFloat)lineWidth outerStrokeColor:(UIColor *)outerStrokeColor innerStrokeColor:(UIColor *)innerStrokeColor;
- (void)increaseProgress;
- (void)decreaseProgress;

@end
