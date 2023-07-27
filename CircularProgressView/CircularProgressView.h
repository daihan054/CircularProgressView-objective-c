#import <UIKit/UIKit.h>

@interface CircularProgressView : UIView

@property (nonatomic) IBInspectable CGFloat radius;
@property (nonatomic) IBInspectable CGFloat lineWidth;
@property (nonatomic, strong) IBInspectable UIColor *outerStrokeColor;
@property (nonatomic, strong) IBInspectable UIColor *innerStrokeColor;

- (instancetype)initWithCenter:(CGPoint)center radius:(CGFloat)radius lineWidth:(CGFloat)lineWidth outerStrokeColor:(UIColor *)outerStrokeColor innerStrokeColor:(UIColor *)innerStrokeColor;
- (void)increaseProgress;
- (void)decreaseProgress;

@end
