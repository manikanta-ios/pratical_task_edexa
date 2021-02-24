//
//  CitiesAPIService.swift
//  pratical_task_edexa
//
//  Created by VenkataRao on 24/02/21.
//  Copyright © 2021 edexa. All rights reserved.
//

import Foundation
import Foundation
import UIKit

class CitiesAPIService: NSObject, Requestable {

    static let instance = CitiesAPIService()
    public var cities: [City]?
    
    func fetchCities(callback: @escaping Handler) {
        request(method: .get, url: Domain.baseUrl() + APIEndpoint.cities) { (result) in
           callback(result)
        }
    }
}
