//
//  Action.swift
//  NFC-Smart-Home
//
//  Created by Garage on 10/12/17.
//  Copyright © 2017 Garage. All rights reserved.
//

import Foundation

class Action {
    private let requestServices = RequestServices()
    public var _deviceId = ""
    public var _url: String = ""
    public var _powered: Bool = false

    init(deviceId: String, powered: Bool) {
        _deviceId = deviceId
        _url = "https://api.wink.com/light_bulbs/" + deviceId + "/desired_state"
        _powered = powered
    }
    
    func executeAction() {
        let request = requestServices.buildRequest(urlString: _url, powered: _powered)
        requestServices.executeRequest(request: request)
    }
}
