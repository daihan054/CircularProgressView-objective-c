#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CircularProgressView : UIView

@property (nonatomic) IBInspectable CGFloat radius;
@property (nonatomic) IBInspectable CGFloat lineWidth;
@property (nonatomic) IBInspectable UIColor *outerStrokeColor;
@property (nonatomic) IBInspectable UIColor *innerStrokeColor;

- (void)increaseProgress;
- (void)decreaseProgress;
- (instancetype)initWithFrame:(CGRect)frame radius:(CGFloat)radius lineWidth:(CGFloat)lineWidth outerStrokeColor:(UIColor *)outerStrokeColor innerStrokeColor:(UIColor *)innerStrokeColor;

@end
