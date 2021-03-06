//
//  Mission.swift
//  Moonshot
//
//  Created by Takasur Azeem on 09/03/2022.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
}

extension Mission {
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "Launch Date N/A"
    }
    
    var accessibilityLabel: String {
        let launchDate = launchDate?.formatted(date: .abbreviated, time: .omitted)
        let label = "\(displayName), \(launchDate != nil ? "Launch Date: \(launchDate!)" : "Launch date not known")"
//        print(label)
        return label
    }
}
