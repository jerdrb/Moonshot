//
//  ContentView.swift
//  Moonshot
//
//  Created by Jared Bell on 2/1/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State var showingGrid = true
    
    var body: some View {
        NavigationView {
                Group {
                    if showingGrid {
                        GridLayout(astronauts: astronauts, missions: missions)
                    } else {
                        ListLayout(astronauts: astronauts, missions: missions)
                    }
                }
            }
        }
    func GridLayout(astronauts: [String: Astronaut], missions: [Mission]) -> some View {
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
                    showingGrid.toggle()
                }
            }
        }
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
    
    func ListLayout(astronauts: [String: Astronaut], missions: [Mission]) -> some View {
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
        .navigationTitle("Moonshot")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Change View") {
                    showingGrid.toggle()
                }
            }
        }
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
