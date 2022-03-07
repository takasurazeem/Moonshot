//
//  NavigationLinkPractice.swift
//  Moonshot
//
//  Created by Takasur Azeem on 07/03/2022.
//

import SwiftUI

struct NavigationLinkPractice: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink {
                    Text("Detail \(row)")
                } label: {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
        .navigationViewStyle(.stack)
    }
}

struct NavigationLinkPractice_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkPractice()
    }
}
