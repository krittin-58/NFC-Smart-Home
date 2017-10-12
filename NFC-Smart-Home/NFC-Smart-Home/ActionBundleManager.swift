//
//  ActionBundleManager.swift
//  NFC-Smart-Home
//
//  Created by Garage on 10/12/17.
//  Copyright © 2017 Garage. All rights reserved.
//

import Foundation

class ActionBundleManager {
    public var _actionBundles: Array<ActionBundle> = Array<ActionBundle>()
    
    init() {
        let action_1 = Action(url: "http://my-api/turn_on_light")
        let action_2 = Action(url: "http://my-api/turn_off_light")
        let action_3 = Action(url: "http://my-api/turn_on_fan")
        let action_4 = Action(url: "http://my-api/turn_off_fan")
        
        let action_bundle_1 = ActionBundle(actionBundleId: 1, actions: [action_1, action_3])
        let action_bundle_2 = ActionBundle(actionBundleId: 2, actions: [action_2, action_4])
        let action_bundle_3 = ActionBundle(actionBundleId: 3, actions: [action_1, action_4])
        
        _actionBundles = [action_bundle_1, action_bundle_2, action_bundle_3]
    }
    
    func callActionBundleWithId(id: Int) {
        for actionBundle in _actionBundles {
            if (actionBundle._actionBundleId == id) {
                actionBundle.executeActions()
            }
        }
    }
}

