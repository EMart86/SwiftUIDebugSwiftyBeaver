//
//  SwiftyBeaverLogProvider.swift
//  Pods
//
//  Created by Martin Eberl on 15.08.17.
//
//

import Foundation
import SwiftUIDebug
import SwiftyBeaver

public final class SwiftyUIDegubDestination: BaseDestination, SwiftLogProviderProtocol {
    public static var shared: SwiftyUIDegubDestination = {
        return SwiftyUIDegubDestination()
    }()
    
    private var observers = [WeakObserver]()
    public private(set) var logs = [SwiftLogProtocol]() {
        didSet {
            if logs.count > maxEntries {
                logs.removeFirst(logs.count - maxEntries)
            }
        }
    }
    public var maxEntries: Int = .max
    
    public func add(_ log: SwiftLogProtocol) {
        logs.append(log)
        
        notifyAsyncDid(add: [log])
    }
    
    public func add(_ logs: [SwiftLogProtocol]) {
        self.logs.append(contentsOf: logs)
        notifyAsyncDid(add: logs)
    }
    
    public func add(_ observer: SwiftLogObserver) {
        guard nil == observers.index(where: { $0.observer === observer }) else {
            return
        }
        observers.append(WeakObserver(observer: observer))
    }
    
    public func remove(_ observer: SwiftLogObserver) {
        guard let index = observers.index(where: { $0.observer === observer }) else {
            return
        }
        observers.remove(at: index)
        removeUnusedObservers()
    }
    
    //MARK: - Private
    
    private func notifyAsyncDid(add item: [SwiftLogProtocol]) {
        DispatchQueue.main.async {[weak self] in
            self?.notifyDidAdd(items: item)
        }
    }
    
    private func index(of weakObserver: WeakObserver) -> Int? {
        return observers.index(where: { $0 == weakObserver })
    }
    
    private func remove(_ weakObserver: WeakObserver) {
        guard let index = index(of: weakObserver) else {
            return
        }
        observers.remove(at: index)
    }
    
    public func removeUnusedObservers() {
        let unused = observers.filter({ $0.observer == nil })
        for observer in unused {
            remove(observer)
        }
    }
    
    private func notifyDidAdd(items: [SwiftLogProtocol]) {
        removeUnusedObservers()
        observers.forEach({
            $0.observer?.didAdd(items: items)
        })
    }
    
    override public func send(_ level: SwiftyBeaver.Level, msg: String, thread: String,
                              file: String, function: String, line: Int, context: Any? = nil) -> String? {
        guard let formattedString = super.send(level, msg: msg, thread: thread, file: file, function: function, line: line, context: context) else {
            return nil
        }
        
        add(SwiftLog(nil, formattedString))
        
        return formattedString
    }
}
