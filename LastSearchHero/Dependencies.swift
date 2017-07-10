//
//  Dependencies.swift
//  RxExample
//
//  Created by carlos on 13/5/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if !RX_NO_MODULE
import RxSwift
#endif

import class Foundation.URLSession
import class Foundation.OperationQueue
import enum Foundation.QualityOfService

class Dependencies {

    static let sharedDependencies = Dependencies() // Singleton
    
    let URLSession = Foundation.URLSession.shared
    let backgroundWorkScheduler: ImmediateSchedulerType
    let mainScheduler: SerialDispatchQueueScheduler
    let reachabilityService: ReachabilityService
    
    private init() {
        
        let operationQueue = OperationQueue()
        operationQueue.maxConcurrentOperationCount = 2
        #if !RX_NO_MODULE
        operationQueue.qualityOfService = QualityOfService.userInitiated
        #endif
        backgroundWorkScheduler = OperationQueueScheduler(operationQueue: operationQueue)
        
        mainScheduler = MainScheduler.instance
        reachabilityService = try! DefaultReachabilityService() // try! is only for simplicity sake
    }
    
}
