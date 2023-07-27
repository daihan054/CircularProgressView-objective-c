#import "CircularProgressView.h"

@implementation CircularProgressView {
    CAShapeLayer *backgroundCircle;
    CAShapeLayer *progressCircle;
    CGFloat progress;
}

- (instancetype)initWithCenter:(CGPoint)center radius:(CGFloat)radius lineWidth:(CGFloat)lineWidth outerStrokeColor:(UIColor *)outerStrokeColor innerStrokeColor:(UIColor *)innerStrokeColor {
    self = [super init];
    if (self) {
        _radius = radius;
        _lineWidth = lineWidth;
        _outerStrokeColor = outerStrokeColor;
        _innerStrokeColor = innerStrokeColor;

        // Set up the shape of the circle
        // Background circle
        backgroundCircle = [CAShapeLayer layer];
        backgroundCircle.path = [UIBezierPath bezierPathWithArcCenter:center radius:_radius startAngle:-M_PI_2 endAngle:2*M_PI-M_PI_2 clockwise:YES].CGPath;
        backgroundCircle.fillColor = [UIColor clearColor].CGColor;
        backgroundCircle.strokeColor = _innerStrokeColor.CGColor;
        backgroundCircle.lineWidth = _lineWidth;
        backgroundCircle.lineCap = kCALineCapRound; // Make the ends of the line round
        [self.layer addSublayer:backgroundCircle];

        // Progress circle
        progressCircle = [CAShapeLayer layer];
        progressCircle.path = [UIBezierPath bezierPathWithArcCenter:center radius:_radius startAngle:-M_PI_2 endAngle:2*M_PI-M_PI_2 clockwise:YES].CGPath;
        progressCircle.fillColor = [UIColor clearColor].CGColor;
        progressCircle.strokeColor = _outerStrokeColor.CGColor;
        progressCircle.lineWidth = _lineWidth;
        progressCircle.lineCap = kCALineCapRound; // Make the ends of the line round
        progressCircle.strokeEnd = 0;
        [self.layer addSublayer:progressCircle];

        progress = 0.0; // Initialize the progress to 0
    }
    return self;
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
