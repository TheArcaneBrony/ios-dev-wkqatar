//
//  ResultsView.swift
//  WKQatar
//
//  Created by RorySys on 03/12/2024.
//

import SwiftUI

struct ResultsView: View {
    @Environment(WKDataStore.self) private var context
    @State var selectedTeam: String?
    @State var selectedLocation: String?
    @State var selectedResult: WKResult?
    
    var body: some View {
        NavigationSplitView {
            List(context.getLocations(), id: \.self, selection: $selectedLocation){ loc in
                Text(loc)
            }
        } content: {
            if(selectedLocation == nil) {
                Text("selectedLocation is nil")
            }
            else {
                List(context.getAllResultsByLocation(location: selectedLocation!), id: \.self, selection: $selectedResult) { result in
                    HStack {
                        if result != nil {
                            Grid  {
                                GridRow {
                                    Text(result!.homeTeam).foregroundColor(selectedTeam == result!.homeTeam ? .red : .white)
                                    Text(" X ")
                                    Text(result!.awayTeam).foregroundColor(selectedTeam == result!.awayTeam ? .red : .white)
                                }.frame(maxWidth: .infinity)
                                if result!.homeTeamScore != nil && result!.awayTeamScore != nil {
                                    GridRow {
                                        Text("\(result!.homeTeamScore!)")
                                        Text(" - ")
                                        Text("\(result!.awayTeamScore!)")
                                    }.frame(maxWidth: .infinity)
                                }
                                Divider()
                            }
                            
                        }
                    }
                }
            }
        } detail: {
            if(selectedResult == nil){
                Text("selectedResult is nil")
            }
            else {
                Text(selectedResult.debugDescription);
            }
        }
    }
}

#Preview {
    @Previewable @State var data = WKDataStore()
    ResultsView().environment(data)
}
