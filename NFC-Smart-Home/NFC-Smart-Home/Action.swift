//
//  Action.swift
//  NFC-Smart-Home
//
//  Created by Garage on 10/12/17.
//  Copyright © 2017 Garage. All rights reserved.
//

import Foundation

class Action {
    public var _url: String = ""

    init(url: String) {
        _url = url
    }
    
    func executeAction() {
        print("Calling: \(_url)")
    }
}
