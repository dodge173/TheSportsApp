//
//  LatestResultsModels.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 22/06/2022.
//

import Foundation


struct LatestResults: Codable {
    
    let events: [LatestResultsModel]
}


struct LatestResultsModel: Codable {
    let strHomeTeam, strAwayTeam, strTime, dateEvent, intHomeScore, intAwayScore: String?
}

