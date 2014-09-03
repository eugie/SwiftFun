import Quick
import Nimble
import UIKit

class SignInViewControllerSpec: QuickSpec {
    override func spec() {
        var subject: SignInViewController?
        
        beforeEach {
            subject = SignInViewController();
            expect(subject!.view).toNot(beNil());
        }
        
        it("should disable the sign in button by default") {
            expect(subject!.signInButton!.enabled).to(beFalsy());
        }
        
        describe("entering a username") {
            beforeEach {
                subject!.usernameTextField!.text = "username";
                subject!.usernameTextField!.sendActionsForControlEvents(UIControlEvents.EditingChanged);
            }
            
            it("should not enable the sign in button") {
                expect(subject!.signInButton!.enabled).toNot(beTruthy());
            }
            
            describe("then entering a password") {
                beforeEach {
                    subject!.passwordTextField!.text = "password";
                    subject!.passwordTextField!.sendActionsForControlEvents(UIControlEvents.EditingChanged);
                }
                
                it("should enable the sign in button") {
                    expect(subject!.signInButton!.enabled).to(beTruthy());
                }
            }
            
            describe("then entering a blank password") {
                beforeEach {
                    subject!.passwordTextField!.text = "   ";
                    subject!.passwordTextField!.sendActionsForControlEvents(UIControlEvents.EditingChanged);
                }
                
                it("should not enable the sign in button") {
                    expect(subject!.signInButton!.enabled).toNot(beTruthy());
                }
            }
        }
        
        describe("entering a password") {
            beforeEach {
                subject!.passwordTextField!.text = "password";
                subject!.passwordTextField!.sendActionsForControlEvents(UIControlEvents.EditingChanged);
            }
            
            it("should not enable the sign in button") {
                expect(subject!.signInButton!.enabled).toNot(beTruthy());
            }
            
            describe("then entering a username") {
                beforeEach {
                    subject!.usernameTextField!.text = "username";
                    subject!.usernameTextField!.sendActionsForControlEvents(UIControlEvents.EditingChanged);
                }
                
                it("should enable the sign in button") {
                    expect(subject!.signInButton!.enabled).to(beTruthy());
                }
            }
            
            describe("then entering a blank username") {
                beforeEach {
                    subject!.usernameTextField!.text = "   ";
                    subject!.usernameTextField!.sendActionsForControlEvents(UIControlEvents.EditingChanged);
                }
                
                it("should not enable the sign in button") {
                    expect(subject!.signInButton!.enabled).toNot(beTruthy());
                }
            }
        }
        
        describe("tapping the sign in button") {
            var presentingViewController: UIViewController?
            
            beforeEach {
                presentingViewController = UIViewController();
                presentingViewController!.presentViewController(subject!, animated: false, completion: nil);
                
                subject!.usernameTextField!.text = "username";
                subject!.usernameTextField!.sendActionsForControlEvents(UIControlEvents.EditingChanged);
                subject!.passwordTextField!.text = "password";
                subject!.passwordTextField!.sendActionsForControlEvents(UIControlEvents.EditingChanged);
                
                subject!.signInButton!.tap();
            }
            
            it("should dismiss the sign in controller") {
                expect(presentingViewController!.presentedViewController).to(beNil());
            }
        }
    }
}
