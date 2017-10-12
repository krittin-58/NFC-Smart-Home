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
        // turn on plug
        let action_1 = Action(url: "https://api.wink.com/light_bulbs/3035644/desired_state", powered: true)
    
        // turn off plug
        let action_2 = Action(url: "https://api.wink.com/light_bulbs/3035644/desired_state", powered: false)
        
        // turn on light
        let action_3 = Action(url: "https://api.wink.com/light_bulbs/3032585/desired_state", powered: true)
        
        // turn off light
        let action_4 = Action(url: "https://api.wink.com/light_bulbs/3032585/desired_state", powered: false)
        
        let action_bundle_1 = ActionBundle(actionBundleId: 1, actions: [action_1, action_3])
        let action_bundle_2 = ActionBundle(actionBundleId: 2, actions: [action_2, action_4])
        let action_bundle_3 = ActionBundle(actionBundleId: 3, actions: [action_3])
        let action_bundle_4 = ActionBundle(actionBundleId: 4, actions: [action_4])
        
        _actionBundles = [action_bundle_1, action_bundle_2, action_bundle_3, action_bundle_4]
    }
    
    func callActionBundleWithId(id: Int) {
        for actionBundle in _actionBundles {
            if (actionBundle._actionBundleId == id) {
                actionBundle.executeActions()
            }
        }
    }
}

