//
//  WKDataStore.swift
//  WKQatar
//
//  Created by RorySys on 03/12/2024.
//
import Foundation;

@Observable
class WKDataStore {
    
    func getWKResults() -> [WKResult] {
        return load("WKResultsQatar.json")
    }
    
    func getTeams() -> [String] {
        let teams = getWKResults()
            .filter { wkResult in wkResult.group != nil}
            .map { res in res.awayTeam }
        return Set(teams).sorted()
    }
    
    func getLocations() -> [String] {
        let locations = getWKResults()
            .filter { wkResult in wkResult.group != nil}
            .map { res in res.location }
        return Set(locations).sorted()
    }
    
    func getAllResultsByLocation(location: String) -> [WKResult?] {
        return getWKResults().filter { result in
            result.location == location
        }
    }

}
