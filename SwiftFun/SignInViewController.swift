import Foundation
import UIKit

class SignInViewController: UIViewController {
    
    var usernameTextField: UITextField?
    var passwordTextField: UITextField?
    var signInButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.backgroundColor = UIColor.whiteColor();
        
        var label = UILabel(frame: CGRectMake(10, 30, 300, 40));
        label.text = "Sign In";
        label.textAlignment = NSTextAlignment.Center;
        self.view.addSubview(label);
        
        usernameTextField = UITextField(frame: CGRectMake(10, 100, 300, 44));
        if let usernameTextField = usernameTextField {
            usernameTextField.layer.borderColor = UIColor.blackColor().CGColor;
            usernameTextField.layer.borderWidth = 1.0;
            usernameTextField.autocorrectionType = UITextAutocorrectionType.No;
            
            usernameTextField.addTarget(self, action: "didChangeUsername", forControlEvents: UIControlEvents.EditingChanged);
            
            self.view.addSubview(usernameTextField);
        }
        
        passwordTextField = UITextField(frame: CGRectMake(10, 150, 300, 44));
        if let passwordTextField = passwordTextField {
            passwordTextField.layer.borderColor = UIColor.blackColor().CGColor;
            passwordTextField.layer.borderWidth = 1.0;
            passwordTextField.secureTextEntry = true;
            
            passwordTextField.addTarget(self, action: "didChangePassword", forControlEvents: UIControlEvents.EditingChanged);
            
            self.view.addSubview(passwordTextField);
        }
        
        signInButton = UIButton(frame: CGRectMake(10, 200, 300, 44));
        if let signInButton = signInButton {
            signInButton.enabled = false;
            signInButton.backgroundColor = UIColor.cyanColor();
            signInButton.setTitle("Sign In", forState: UIControlState.Normal);
            signInButton.setTitleColor(UIColor.magentaColor(), forState: UIControlState.Normal);
            signInButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Disabled);
            
            signInButton.addTarget(self, action: "didTapSignInButton", forControlEvents: UIControlEvents.TouchUpInside);
            
            self.view.addSubview(signInButton);
        }
    }
    
// MARK: Actions
    
    func didChangeUsername() {
        validateUsernameAndPasswordFields();
    }
    
    func didChangePassword() {
        validateUsernameAndPasswordFields();
    }
    
    func didTapSignInButton() {
        self.view.endEditing(true);
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
// MARK: Private
    
    func validateUsernameAndPasswordFields() {
        if (usernameTextField!.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).isEmpty) {
            signInButton?.enabled = false;
        } else if (passwordTextField!.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).isEmpty) {
            signInButton?.enabled = false;
        } else {
            signInButton?.enabled = true;
        }
    }
}