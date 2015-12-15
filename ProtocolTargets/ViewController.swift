//
//  ViewController.swift
//  ProtocolTargets
//
//  Created by Yu, William on 12/14/15.
//  Copyright © 2015 Yu, William. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myView = MyView()
//        myView.delegate = SegmentedControlImplMethodSignatureForSelector()
//        myView.delegate = SegmentedControlImplInvalidArgumentException()
        myView.delegate = SegmentedControlImplWorking()
        self.view = myView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


class MyView : UIView {
    var delegate: SegmentedControlDelegate? {
        didSet {
            if let target = delegate {
                segmentedControl.addTarget(target, action: "indexChanged:", forControlEvents: .ValueChanged)
            }
        }
    }
    
    init() {
        super.init(frame: CGRectZero)
        addSubview(segmentedControl)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var segmentedControl = UISegmentedControl(items:["First", "Second"])
    
    override func layoutSubviews() {
        segmentedControl.frame = CGRectMake(0, 44, bounds.width, 44)
    }
}
