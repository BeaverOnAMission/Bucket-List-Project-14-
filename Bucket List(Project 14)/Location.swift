//
//  Location.swift
//  Bucket List(Project 14)
//
//  Created by mac on 18.07.2023.
//

import Foundation
import CoreLocation
struct Location: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var description: String
    var type: String
    let latitude: Double
    let longitude: Double
    var coordinate:CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    static let example = Location(id: UUID(), name: "Bucingham Palace", description: "Where dorgies lives", type: "Other", latitude: 51.501, longitude: -0.141)
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
