import Foundation
import UIKit

class MainViewController: UIViewController {
 
    var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        label = UILabel(frame: CGRectMake(0, 0, 100, 100));
        
        if let label = label {
            label.text = "Hello World";
            self.view.addSubview(label);
        }
    }
}