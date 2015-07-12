#import <UIKit/UIKit.h>

#if defined(__has_include)
#if __has_include(<IKEvents/IKEvent.h>)

#define IKNavigationDelegateOK
#import <IKEvents/IKEvent.h>

//TODO: add tests

@interface IKNavigationDelegate : NSObject
-(instancetype)initWithNavigationController:(UINavigationController *)navController;
-(void)subscribe:(UINavigationController *)navigationController;

@property (nonatomic, strong, readonly) IKEvent *willShow; /* UINavigationController, UIViewController(new), UIViewController(old) */
@property (nonatomic, strong, readonly) IKEvent *didShow; /* UINavigationController, UIViewController(new)> */
@end

#endif
#endif