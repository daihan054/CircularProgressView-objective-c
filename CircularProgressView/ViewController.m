#import "ViewController.h"
#import "CircularProgressView.h"

@interface ViewController ()
@property (nonatomic, strong) CircularProgressView *progressView;
@property (nonatomic, strong) UIButton *plusButton;
@property (nonatomic, strong) UIButton *minusButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor]; // Set the root view color to blue
    
    self.progressView = [[CircularProgressView alloc]
                         initWithCenter:self.view.center
                         radius:100
                         lineWidth:10
                         outerStrokeColor:[UIColor whiteColor]
                         innerStrokeColor:[UIColor grayColor]];
    [self.view addSubview:self.progressView];
    
    int buttonWidth = 80;
    int buttonHeight = 40;
    self.minusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.minusButton.frame = CGRectMake(self.view.center.x - buttonWidth - 10, self.view.center.y + self.progressView.frame.size.height / 2 + 10, buttonWidth, buttonHeight);
    [self.minusButton setTitle:@"Minus" forState:UIControlStateNormal];
    [self.minusButton addTarget:self action:@selector(decreaseProgress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.minusButton];
    
    self.plusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.plusButton.frame = CGRectMake(self.view.center.x + 10, self.view.center.y + self.progressView.frame.size.height / 2 + 10, buttonWidth, buttonHeight);
    [self.plusButton setTitle:@"Plus" forState:UIControlStateNormal];
    [self.plusButton addTarget:self action:@selector(increaseProgress) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.plusButton];
}

// Method to increase the progress
- (void)increaseProgress {
    [self.progressView increaseProgress];
}

// Method to decrease the progress
- (void)decreaseProgress {
    [self.progressView decreaseProgress];
}

@end
