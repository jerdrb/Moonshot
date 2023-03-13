//
//  ListLayout.swift
//  Moonshot
//
//  Created by Jared Bell on 3/12/23.
//

import Foundation
import SwiftUI

let rows = [
    GridItem(.adaptive(minimum: 150))
]

func ListLayouts(astronauts: [String: Astronaut], missions: [Mission]) -> some View {
    List {
        ForEach(missions) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
                HStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    
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
    .padding([.horizontal, .bottom])
}

