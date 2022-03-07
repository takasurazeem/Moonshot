//
//  ScrollViewPractice.swift
//  Moonshot
//
//  Created by Takasur Azeem on 07/03/2022.
//

import SwiftUI

struct ScrollViewPractice: View {
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(1..<101) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollViewPractice_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewPractice()
    }
}

struct CustomText: View {
    let text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new CustomText")
        self.text = text
    }
}
