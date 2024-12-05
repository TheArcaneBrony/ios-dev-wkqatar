//
//  WKResult.swift
//  WKQatar2022
//
//  Created by Dirk Hostens on 29/11/2022.
//

import Foundation

// MARK: - WKResult
class WKResult: Codable, Hashable, Identifiable {
    //equitable
    static func == (lhs: WKResult, rhs: WKResult) -> Bool {
        lhs.matchNumber == rhs.matchNumber
    }
    //hashable
    func hash(into hasher: inout Hasher) {
        hasher.combine(matchNumber)
       
    }
    
    let matchNumber, roundNumber: Int
    let dateUTC, location, homeTeam, awayTeam: String
    let group: String?
    let homeTeamScore, awayTeamScore: Int?

    enum CodingKeys: String, CodingKey {
        case matchNumber = "MatchNumber"
        case roundNumber = "RoundNumber"
        case dateUTC = "DateUtc"
        case location = "Location"
        case homeTeam = "HomeTeam"
        case awayTeam = "AwayTeam"
        case group = "Group"
        case homeTeamScore = "HomeTeamScore"
        case awayTeamScore = "AwayTeamScore"
    }

    init(matchNumber: Int, roundNumber: Int, dateUTC: String, location: String, homeTeam: String, awayTeam: String, group: String?, homeTeamScore: Int?, awayTeamScore: Int?) {
        self.matchNumber = matchNumber
        self.roundNumber = roundNumber
        self.dateUTC = dateUTC
        self.location = location
        self.homeTeam = homeTeam
        self.awayTeam = awayTeam
        self.group = group
        self.homeTeamScore = homeTeamScore
        self.awayTeamScore = awayTeamScore
    }
    
}
