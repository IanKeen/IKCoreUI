#import "IKNavigationDelegate.h"
#ifdef IKNavigationDelegateOK

@interface IKNavigationDelegate () <UINavigationControllerDelegate>
@end

@implementation IKNavigationDelegate
#pragma mark - Lifecycle
-(instancetype)initWithNavigationController:(UINavigationController *)navController {
    if (!(self = [super init])) { return nil; }
    
    _willShow = [IKEvent new];
    _didShow = [IKEvent new];
    
    [self subscribe:navController];
    return self;
}

#pragma mark - Public
-(void)subscribe:(UINavigationController *)navigationController {
    navigationController.delegate = self;
}

#pragma mark - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    notify(self.willShow, navigationController, viewController, navigationController.visibleViewController);
}
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    notify(self.didShow, navigationController, viewController);
}
@end

#endif