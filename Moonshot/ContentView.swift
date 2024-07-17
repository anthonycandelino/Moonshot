//
//  ContentView.swift
//  Moonshot
//
//  Created by Anthony Candelino on 2024-07-07.
//

import SwiftUI

struct MissionData: Hashable {
    var id = UUID()
    var missions: [Mission]
    
    init(id: UUID = UUID(), missions: [Mission]) {
        self.id = id
        self.missions = missions
    }
}

struct ContentView: View {
    @State private var isGrid = true
    let missionData = MissionData(missions: Bundle.main.decode("missions.json"))
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if isGrid {
                    GridLayout(missions: missionData.missions)
                        .transition(.slide)
                } else {
                    ListLayout(missions: missionData.missions)
                        .transition(.slide)
                }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation() {
                            isGrid.toggle()
                        }
                    } label: {
                        HStack {
                            Image(systemName: isGrid ?  "square.grid.2x2" : "list.bullet")
                                .foregroundStyle(.white)
                                .font(.title2)
                        }
                    }
                    .contentTransition(.symbolEffect(.replace))
                    
                }
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
