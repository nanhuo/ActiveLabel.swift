//
//  ViewController.swift
//  ActiveLabelDemo
//
//

import UIKit
import ActiveLabel

class ViewController: UIViewController {
    
    let label = ActiveLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "This is a post with #multiple #hashtags and a @userhandle. Links are also supported like this one: https://www.google.com. Phone numbers as well, 010-2121212 for example. \n\n中文：文本支持多个＃中文标签 和＃english_tag；支持@某人；支持链接如https://www.google.com；支持电话号码如15011001100。"
        label.numberOfLines = 0
        label.lineSpacing = 4
        
        label.handleMentionTap { self.alert("Mention", message: $0) }
        label.handleHashtagTap { self.alert("Hashtag", message: $0) }
        label.handleURLTap { self.alert("URL", message: $0.description) }
        label.handlePhoneNumberTap { self.alert("PhoneNumber", message: $0) }
        
        label.frame = CGRect(x: 20, y: 40, width: view.frame.width - 40, height: 300)
        view.addSubview(label)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alert(title: String, message: String) {
        let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        vc.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
        presentViewController(vc, animated: true, completion: nil)
    }

}

