//
//  MissionView.swift
//  Moonshot
//
//  Created by Anthony Candelino on 2024-07-11.
//

import SwiftUI

struct MissionView: View {
    
    let mission: Mission
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.bottom)
                
                    Text(mission.formattedLaunchDate)
                        .font(.title.bold())
                        .padding()
                        .background(.lightBackground)
                        .clipShape(Capsule())
                        .padding(.bottom)
                
                VStack(alignment: .leading) {
                    SectionTitle(title: "Mission Highlights")
                    Text(mission.description)
                        .padding(.bottom)
                    SectionTitle(title: "\(mission.displayName) Crew")
                }
                .padding(.horizontal)
                
                CrewScrollView(mission: mission, astronauts: astronauts)
                
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    return MissionView(mission: missions[4])
        .preferredColorScheme(.dark)
}
