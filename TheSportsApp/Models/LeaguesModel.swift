//
//  LeaguesModel.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 20/06/2022.
//

import Foundation

struct Leagues: Codable {
    
    let countries: [LeaguesModel]

}

struct LeaguesModel: Codable {
    
    let strLeague: String
    let strSport: String
    let idLeague: String
    let strBadge: String
    let strYoutube: String
}

