//
//  TeamsModel.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 22/06/2022.
//

import Foundation


struct Teams: Codable {
    
    let teams: [TeamsModel]
}

struct TeamsModel : Codable {
    
    let strTeamBadge, strTeam: String
}
