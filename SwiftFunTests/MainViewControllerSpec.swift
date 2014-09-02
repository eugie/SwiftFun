import Quick
import Nimble

class MainViewControllerSpec: QuickSpec {
    override func spec() {
        var subject: MainViewController?
        
        beforeEach { () -> () in
            subject = MainViewController();
            expect(subject!.view).notTo(beNil());
        }
        
        it("has a label that says Hello World", { () -> () in
            expect(subject!.label!.text).to(equal("Hello World"));
            expect(subject!.label!.superview).to(equal(subject!.view));
        });
    }
}
