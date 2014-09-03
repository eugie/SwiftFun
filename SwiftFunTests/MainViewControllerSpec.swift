import Quick
import Nimble
import UIKit

class MainViewControllerSpec: QuickSpec {
    override func spec() {
        var subject: MainViewController?
        
        beforeEach {
            subject = MainViewController();
            expect(subject!.view).notTo(beNil());
        }
        
        it("has a label that says Hello World") {
            expect(subject!.label!.text).to(equal("Hello World"));
            expect(subject!.label!.superview).to(equal(subject!.view));
        }
        
        it("has a button that says Show Sign In Screen") {
            expect(subject!.signInButton!.titleForState(UIControlState.Normal)).to(equal("Show Sign In Screen"));
            expect(subject!.signInButton!.superview).to(equal(subject!.view));
        }
        
        describe("tapping the sign in button") {
            beforeEach{
                subject!.signInButton!.tap();
            }
            
            it("presents a sign in controller") {
                expect(subject!.presentedViewController).to(beAnInstanceOf(SignInViewController));
            }
        }
    }
}
