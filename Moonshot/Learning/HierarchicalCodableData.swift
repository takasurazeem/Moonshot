//
//  HierarchicalCodableData.swift
//  Moonshot
//
//  Created by Takasur Azeem on 07/03/2022.
//

import SwiftUI

struct HierarchicalCodableData: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
                {
                    "name": "Takasur Azeem",
                    "address": {
                        "street": "https",
                        "city": "WWW"
                    }
                }
                """
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

struct HierarchicalCodableData_Previews: PreviewProvider {
    static var previews: some View {
        HierarchicalCodableData()
    }
}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}
