//
//  GridLayout.swift
//  Moonshot
//
//  Created by Jared Bell on 3/12/23.
//

import Foundation
import SwiftUI

let columns = [
    GridItem(.adaptive(minimum: 150))
]

func GridLayouts(astronauts: [String: Astronaut], missions: [Mission]) -> some View {
    ScrollView {
        LazyVGrid(columns: columns) {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronauts)
                } label: {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                    }
                }
            }
        }
    }
    .navigationTitle("Moonshot")
    .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button("Change View") {
                //do something
            }
        }
    }
    .background(.darkBackground)
    .preferredColorScheme(.dark)
}
