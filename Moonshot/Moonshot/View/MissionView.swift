//
//  MissionView.swift
//  Moonshot
//
//  Created by Ceren Güneş on 7.02.2024.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {
                        width, axes in
                        width * 0.6
                    }
                
                VStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
                            } label: {
                                HStack {
                                    CrewImageView(crewMember: crewMember)
                                    CrewView(mission: mission, crewMember: crewMember)
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map({ member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        })
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}

struct CrewView: View {
    let mission: Mission
    let crewMember: CrewMember
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(mission.formattedLaunchDate)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.5))
            
            Text(crewMember.astronaut.name)
                .foregroundStyle(.white)
                .font(.headline)
            
            Text(crewMember.role)
                .foregroundStyle(.white.opacity(0.5))
        }
    }
}

struct CrewImageView: View {
    let crewMember: CrewMember
    
    var body: some View {
        Image(crewMember.astronaut.id)
            .resizable()
            .frame(width: 104, height: 72)
            .clipShape(.capsule)
            .overlay {
                Capsule()
                    .strokeBorder(.white, lineWidth: 1)
            }
    }
}
