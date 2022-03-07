//
//  GeometryReaderPractice.swift
//  Moonshot
//
//  Created by Takasur Azeem on 07/03/2022.
//

import SwiftUI

struct GeometryReaderPractice: View {
    var body: some View {
        GeometryReader { geo in
            Image("Example")
                .resizable()
                .scaledToFit()
                .frame(width: geo.size.width * 0.8)
                .frame(width: geo.size.width, height: geo.size.height)
        }
    }
}

struct GeometryReaderPractice_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderPractice()
    }
}
