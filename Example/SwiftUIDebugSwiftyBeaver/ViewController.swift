//
//  ViewController.swift
//  SwiftUIDebugSwiftyBeaver
//
//  Created by eberl_ma@gmx.at on 08/15/2017.
//  Copyright (c) 2017 eberl_ma@gmx.at. All rights reserved.
//

import UIKit
import SwiftUIDebug
import SwiftyBeaver
import SwiftUIDebugSwiftyBeaver

class ViewController: UIViewController {
    
    let log = SwiftyBeaver.self
    let uiDestination = SwiftyUIDegubDestination.shared
    let logProvider = LogProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        log.addDestination(uiDestination)
        
        logProvider.start()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            SwiftUIDebug.debugController(with: self,
                                         viewModel: SwiftLogViewModel(provider: uiDestination))
        }
    }
    
}

