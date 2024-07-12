//
//  ContentView.swift
//  Moonshot
//
//  Created by Anthony Candelino on 2024-07-07.
//

import SwiftUI

struct ContentView: View {
    @State private var isGrid = true
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if isGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                        .transition(.slide)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
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
