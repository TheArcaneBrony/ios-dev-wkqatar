//
//  WelcomeView.swift
//  WKQatar
//
//  Created by RorySys on 03/12/2024.
//

import SwiftUI

struct WelcomeView: View {
    @Environment(WKDataStore.self) private var context
    @State var selectedTeam: String?
    
    var body: some View {
        NavigationStack {
            Text("WK QATAR 2020").font(.largeTitle)
            Text("Select your favorite team...")
            
            List(context.getTeams(), id: \.self, selection: $selectedTeam) { team in
                Text(team).foregroundColor(selectedTeam == team ? .yellow : .red)
            }
            
            if(selectedTeam != nil) {
                NavigationLink("Next"){
                    ResultsView(selectedTeam: selectedTeam)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var data = WKDataStore()
    WelcomeView(selectedTeam: "Belgium").environment(data)
}
