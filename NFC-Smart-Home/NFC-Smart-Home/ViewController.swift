//
//  ViewController.swift
//  NFC-Smart-Home
//
//  Created by Garage on 10/12/17.
//  Copyright © 2017 Garage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func startImageClicked(_ sender: Any) {
        didTapReadNFC()
    }
    
    @IBOutlet weak var deviceLabel: UILabel!
    @IBOutlet weak var actionCompletedLabel: UILabel!
    
    let helper = NFCHelper()
    var payloadLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let button = UIButton(type: .system)
//        button.setTitle("Tap to Begin", for: .normal)
//        button.titleLabel?.font = UIFont(name: "Helvetica", size: 28.0)
//        button.addTarget(self, action: #selector(didTapReadNFC), for: .touchUpInside)
//        button.frame = CGRect(x: 60, y: 200, width: self.view.bounds.width - 120, height: 80)
//        self.view.addSubview(button)
        
//        payloadLabel = UILabel(frame: button.frame.offsetBy(dx: 0, dy: 300))
//        payloadLabel.numberOfLines = 10
//        payloadLabel.text = ""
//        self.view.addSubview(payloadLabel)
    }
    
    func onNFCResult(success: Bool, msg: String) {
        DispatchQueue.main.async {
            if (msg.lowercased().contains("id:")) {
                let index = msg.index(msg.startIndex, offsetBy: 6)
                let message = msg.substring(from: index)
                let id = Int(message)!
                print("found id: \(id)")
                self.deviceLabel.text = "Call default action for: \(self.deviceLabel.text!)\n\(message)"
                self.actionCompletedLabel.text = "Action Completed!"
            }
        }
    }
    
    @objc func didTapReadNFC() {
        print("didTapReadNFC")
        self.deviceLabel.text = ""
        helper.onNFCResult = onNFCResult(success:msg:)
        helper.restartSession()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
