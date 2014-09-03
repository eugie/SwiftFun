import Foundation
import UIKit

class MainViewController: UIViewController {
 
    var label: UILabel?
    var signInButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        label = UILabel(frame: CGRectMake(10, 50, 300, 50));
        if let label = label {
            label.text = "Hello World";
            label.textAlignment = NSTextAlignment.Center;
            self.view.addSubview(label);
        }
        
        signInButton = UIButton(frame: CGRectMake(10, 200, 300, 44));
        if let signInButton = signInButton {
            signInButton.setTitle("Show Sign In Screen", forState: UIControlState.Normal);
            signInButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal);
            signInButton.backgroundColor = UIColor.purpleColor();
            
            signInButton.addTarget(self, action: "didTapSignInButton", forControlEvents: UIControlEvents.TouchUpInside);
            
            self.view.addSubview(signInButton);
        }
    }
    
// MARK: Actions
    
    func didTapSignInButton() {
        let signInController = SignInViewController();
        self.presentViewController(signInController, animated: true, completion: nil);
    }
}