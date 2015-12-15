//
//  Protocol.swift
//  ProtocolTargets
//
//  Created by Yu, William on 12/14/15.
//  Copyright © 2015 Yu, William. All rights reserved.
//

import UIKit

protocol SegmentedControlDelegate : class {
    func indexChanged(sender: UISegmentedControl)
    func sayHello()
}

extension SegmentedControlDelegate {
    func indexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("First selected");
        case 1:
            print("Second Segment selected");
        default:
            break;
        }
        
        sayHello()
    }
}

/*
2015-12-14 19:34:05.823 ProtocolTargets[33847:307425] *** NSForwarding: warning: object 0x7f9a4353e3b0 of class 'ProtocolTargets.SegmentedControlImpl' does not implement methodSignatureForSelector: -- trouble ahead
Unrecognized selector -[ProtocolTargets.SegmentedControlImpl indexChanged:]
*/
class SegmentedControlImplMethodSignatureForSelector: SegmentedControlDelegate {
    func sayHello() {
        print("Hello")
    }
}

/*
2015-12-14 19:35:07.502 ProtocolTargets[33905:308157] -[ProtocolTargets.SegmentedControlImplError indexChanged:]: unrecognized selector sent to instance 0x7fc26c9818a0
2015-12-14 19:35:07.520 ProtocolTargets[33905:308157] *** Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '-[ProtocolTargets.SegmentedControlImplError indexChanged:]: unrecognized selector sent to instance 0x7fc26c9818a0'
*/
class SegmentedControlImplInvalidArgumentException: UIResponder, SegmentedControlDelegate {
    func sayHello() {
        print("Hello")
    }
}

class SegmentedControlImplWorking: UIResponder, SegmentedControlDelegate {
    func indexChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("First selected");
        case 1:
            print("Second Segment selected");
        default:
            break;
        }
        
        sayHello()
    }
    
    func sayHello() {
        print("Hello")
    }
}

