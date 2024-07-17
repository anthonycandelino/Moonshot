//
//  GridLayout.swift
//  Moonshot
//
//  Created by Anthony Candelino on 2024-07-12.
//

import SwiftUI

struct GridLayout: View {
    let missions: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            .padding()
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    )
                }
                .navigationDestination(for: Mission.self) { mission in
                    MissionView(mission: mission)
                }
                .padding(5)
            }
        }
        .padding([.horizontal, .bottom])
    }
}


#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return GridLayout(missions: missions)
}
