//
//  LeaguesModel.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 20/06/2022.
//

import Foundation

struct Leagues: Codable {
    
    let leagues: [LeaguesModel]

}

struct LeaguesModel: Codable {
    
    let strLeague: String
    let strSport: String
}

