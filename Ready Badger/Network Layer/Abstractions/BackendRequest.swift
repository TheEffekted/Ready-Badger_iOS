//
//  BackendRequest.swift
//  Safety Survey
//
//  Created by Kyle Zawacki on 8/22/16.
//  Copyright © 2016 App Factory. All rights reserved.
//

import Foundation

protocol BackendRequest {
    var endpoint: String { get }
    var method: BackendServiceMethod { get }
    var parameters: [Parameter]? { get }
    var headers: [String: String]? { get }
    var imageData: Data? { get }
    var alernativeUrl: URL? { get }
}
