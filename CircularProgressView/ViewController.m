#import "ViewController.h"
#import "CircularProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet CircularProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIButton *plusButton;
@property (weak, nonatomic) IBOutlet UIButton *minusButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)increaseProgress:(id)sender {
    [self.progressView increaseProgress];
}

- (IBAction)decreaseProgress:(id)sender {
    [self.progressView decreaseProgress];
}

@end
