//
//  MissionView.swift
//  Moonshot
//
//  Created by Takasur Azeem on 12/03/2022.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionView: View {
    
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: astronaut.name, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.top)
                    Text(mission.formattedLaunchDate)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    VStack(alignment: .leading) {
                        Text("Crew")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        CrewMembersScrollView(crew: crew)
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom)
                        
                        CustomDivider()
                        Text(mission.description)
                        CustomDivider()
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
