//
//  CrewMembersScrollView.swift
//  Moonshot
//
//  Created by Takasur Azeem on 13/03/2022.
//

import SwiftUI

struct CrewMembersScrollView: View {
    
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.astronaut.id) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                                .accessibilityHidden(true)
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

struct CrewMembersScrollView_Previews: PreviewProvider {
    static let astronaut = Astronaut(id: "scott", name: "David R. Scott", description: "Descroption")
    static var previews: some View {
        CrewMembersScrollView(crew: Array(repeating: CrewMember(role: astronaut.id, astronaut: astronaut), count: 5))
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            .padding(.vertical)
    }
}
