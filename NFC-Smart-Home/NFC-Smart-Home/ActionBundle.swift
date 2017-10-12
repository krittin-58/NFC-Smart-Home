//
//  ActionBundle.swift
//  NFC-Smart-Home
//
//  Created by Garage on 10/12/17.
//  Copyright © 2017 Garage. All rights reserved.
//

import Foundation

class ActionBundle {
    public var _actionBundleId: Int = -1
    public var _actions: Array<Action> = Array<Action>()
    
    init(actionBundleId: Int, actions: Array<Action>) {
        _actionBundleId = actionBundleId
        _actions = actions
    }
    
    func executeActions() {
        for action in _actions {
            action.executeAction()
        }
    }
}
