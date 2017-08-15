//
//  LogProvider.swift
//  SwiftUIDebug
//
//  Created by Martin Eberl on 13.08.17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import SwiftyBeaver

final class LogProvider {
    private var timer: Timer?
    let log = SwiftyBeaver.self
    
    func start() {
        if #available(iOS 10.0, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in 
                DispatchQueue.global(qos: .background).async {[weak self] in
                    self?.log.debug("Hello World")
                }
            })
        } else {
            // Fallback on earlier versions
        }
    }
    
    func stop() {
        timer?.invalidate()
    }
}
