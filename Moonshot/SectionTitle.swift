//
//  SectionTitle.swift
//  Moonshot
//
//  Created by Anthony Candelino on 2024-07-12.
//

import SwiftUI

struct SectionTitle: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title.bold())
                .padding(.bottom, 5)
                .lineLimit(1)
                .layoutPriority(1)
            Spacer()
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(.lightBackground)
                .padding(.vertical)
        }
    }
}

#Preview {
    SectionTitle(title: "Title")
}
