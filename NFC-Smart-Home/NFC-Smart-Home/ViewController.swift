//
//  ViewController.swift
//  NFC-Smart-Home
//
//  Created by Garage on 10/12/17.
//  Copyright © 2017 Garage. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var deviceLabel: UILabel!
    @IBOutlet weak var actionCompletedLabel: UILabel!
    
    let helper = NFCHelper()
    var payloadLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actionCompletedLabel.isHidden = true
    }

    @objc func hideActionCompletedLabel() {
      self.actionCompletedLabel.isHidden = true
    }
    
    func messageContainsId(message: String) -> Bool {
        return message.lowercased().contains("id:")
    }
    
    func onNFCResult(success: Bool, msg: String) {
        DispatchQueue.main.async {
            if (self.messageContainsId(message: msg)) {
                let index = msg.index(msg.startIndex, offsetBy: 6)
                let message = msg[index...]
                let id = Int(message)
                print("found id: \(id ?? -1)")
                self.deviceLabel.text = "Call default action for: \(message)"
                self.actionCompletedLabel.isHidden = false
                Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.hideActionCompletedLabel), userInfo: nil, repeats: false)
            }
        }
    }
    
    @objc func didTapReadNFC() {
        if (self.actionCompletedLabel.isHidden) {
            helper.onNFCResult = onNFCResult(success:msg:)
            helper.restartSession()
        }
    }
    
    @IBAction func startImageClicked(_ sender: Any) {
        didTapReadNFC()
    }
}
