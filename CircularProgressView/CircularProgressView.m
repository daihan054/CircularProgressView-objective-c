#import "CircularProgressView.h"

@interface CircularProgressView ()
{
    CAShapeLayer *backgroundCircle;
    CAShapeLayer *progressCircle;
    CGFloat progress;
}
@end

@implementation CircularProgressView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (instancetype)initWithFrame:(CGRect)frame radius:(CGFloat)radius lineWidth:(CGFloat)lineWidth outerStrokeColor:(UIColor *)outerStrokeColor innerStrokeColor:(UIColor *)innerStrokeColor {
    self = [super initWithFrame:frame];
    if (self) {
        _radius = radius;
        _lineWidth = lineWidth;
        _outerStrokeColor = outerStrokeColor;
        _innerStrokeColor = innerStrokeColor;
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    // Determine the center of view from the frame
    CGPoint centerOfView = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));

    // Setup backgroundCircle
    backgroundCircle = [CAShapeLayer layer];
    backgroundCircle.path = [UIBezierPath bezierPathWithArcCenter:centerOfView
                                                           radius:_radius
                                                       startAngle:-M_PI_2
                                                         endAngle:2*M_PI-M_PI_2
                                                        clockwise:YES].CGPath;
    backgroundCircle.fillColor = [UIColor clearColor].CGColor;
    backgroundCircle.strokeColor = _innerStrokeColor.CGColor;
    backgroundCircle.lineWidth = _lineWidth;
    backgroundCircle.lineCap = kCALineCapRound;
    [self.layer addSublayer:backgroundCircle];

    // Setup progressCircle
    progressCircle = [CAShapeLayer layer];
    progressCircle.path = [UIBezierPath bezierPathWithArcCenter:centerOfView
                                                         radius:_radius
                                                     startAngle:-M_PI_2
                                                       endAngle:2*M_PI-M_PI_2
                                                      clockwise:YES].CGPath;
    progressCircle.fillColor = [UIColor clearColor].CGColor;
    progressCircle.strokeColor = _outerStrokeColor.CGColor;
    progressCircle.lineWidth = _lineWidth;
    progressCircle.lineCap = kCALineCapRound;
    progressCircle.strokeEnd = 0;
    [self.layer addSublayer:progressCircle];

    progress = 0.0;
}

// Method to increase the progress
- (void)increaseProgress {
    progress += 0.1;
    if (progress > 1.0) {
        progress = 1.0;
    }
    [self updateProgress];
}

// Method to decrease the progress
- (void)decreaseProgress {
    progress -= 0.1;
    if (progress < 0.0) {
        progress = 0.0;
    }
    [self updateProgress];
}

// Method to update the progress on the circle
- (void)updateProgress {
    progressCircle.strokeEnd = progress;
}

@end
