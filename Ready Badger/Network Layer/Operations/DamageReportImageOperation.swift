//
//  DamageReportImageOperation.swift
//  Ready Badger
//
//  Created by Kyle Zawacki on 11/28/16.
//  Copyright © 2016 App Factory. All rights reserved.
//

import Foundation

class DamageReportImageOperation: Operation, BackendOperation {
    
    var service: BackendService = BackendService(config: BackendConfiguration.shared)
    var request: BackendRequest
    
    var handleSuccess: ((NSData) -> Void) {
        return { data in
            do {
                let string = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)
                print(string)
            } catch _ {
                print("JSON Invalid")
            }
        }
    }
    
    var handleFailure: ((NSError) -> Void) {
        return {error in
            print(error)
        }
    }
    
    init(withRequest request: DamageReportImageRequest) {
        self.request = request
        super.init()
    }
    
    override func start() {
        super.start()
        service.request(with: request, success: handleSuccess, failure: handleFailure)
    }
    
    override func cancel() {
        super.cancel()
        service.cancel()
    }
    
}

