//
//  Cities.swift
//  pratical_task_edexa
//
//  Created by VenkataRao on 24/02/21.
//  Copyright © 2021 edexa. All rights reserved.
//

import Foundation

// MARK: - City
struct City: Codable {
    let id: Int
    let city: CityEnum?
    let lastName, firstName: String

    enum CodingKeys: String, CodingKey {
        case id, city
        case lastName = "last_name"
        case firstName = "first_name"
    }
}

enum CityEnum: String, Codable {
    case chicago = "Chicago"
    case losAngeles = "Los Angeles"
    case newYork = "NewYork"
    case all = ""
}


// MARK: Array extension

extension Array where Element == City {
    func getChicago() -> [City] {
        return self.filter({ $0.city == .chicago})
    }

    func getLosAngels() -> [City] {
        return self.filter({ $0.city == .losAngeles})
    }

    func getNewYork() -> [City] {
        return self.filter({ $0.city == .newYork})
    }

}
