//
//  ScrollingGrid.swift
//  Moonshot
//
//  Created by Takasur Azeem on 07/03/2022.
//

import SwiftUI

struct ScrollingGrid: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: layout) {
                ForEach(0..<100) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

struct ScrollingGrid_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingGrid()
    }
}
