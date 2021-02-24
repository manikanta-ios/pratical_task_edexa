//
//  CitiesViewModel.swift
//  pratical_task_edexa
//
//  Created by VenkataRao on 24/02/21.
//  Copyright © 2021 edexa. All rights reserved.
//

import Foundation
import UIKit

protocol CityViewModelProtocol {
    var cityDidChanges: ((Bool, Bool) -> Void)? { get set }
    func fetchCitiesList()
}

class CityViewModel: CityViewModelProtocol {

    //MARK: - Internal Properties
    
    var cityDidChanges: ((Bool, Bool) -> Void)?
    
    var cities: [City]? {
        didSet {
            self.cityDidChanges!(true, false)
        }
    }
    
    var selectedTabData : [City] = []
    
    func fetchCitiesList() {
        self.cities = [City]()
        CitiesAPIService.instance.fetchCities { result in
            switch result {
            case .success(let data):
                let mappedModel = try? JSONDecoder().decode([City].self, from: data) as [City]
                self.cities = mappedModel ?? []
                break
            case .failure(let error):
                
                print(error.description)
            }
        }
    }
    
}
