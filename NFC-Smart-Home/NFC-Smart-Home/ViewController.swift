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
    @IBOutlet weak var scanButton: UIImageView!
    
    let helper = NFCHelper()
    var payloadLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.actionCompletedLabel.isHidden = true
    }

    func messageContainsId(message: String) -> Bool {
        return message.lowercased().contains("id:")
    }
    
    func getIdFromMessage(message: String) -> Int {
        let index = message.index(message.startIndex, offsetBy: 6)
        let id = Int(message[index...])
        return id ?? -1
    }
    
    @objc func setReadyForRead(ready: Bool) {
        if (ready) {
            self.actionCompletedLabel.isHidden = true
            scanButton.image = #imageLiteral(resourceName: "nfc_button.png")
        } else {
            self.actionCompletedLabel.isHidden = false
            scanButton.image = #imageLiteral(resourceName: "nfc_button_grey.png")
        }
    }
    
    func onNFCResult(success: Bool, msg: String) {
        DispatchQueue.main.async {
            if (self.messageContainsId(message: msg)) {
                let id = self.getIdFromMessage(message: msg)
                
                print("found id: \(id)")
                
                self.deviceLabel.text = "Call default action for: \(id)"
                
                // Not ready to read
                self.setReadyForRead(ready: false)
                
                // After 5 seconds, ready to read
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
                    self.setReadyForRead(ready: true)
                })
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
