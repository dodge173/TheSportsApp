//
//  SportsModel.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 19/06/2022.
//

import Foundation

struct Sports: Codable {
    
    let sports: [SportsModel]

}


struct SportsModel: Codable {
    
    let strSport: String?
    let strSportThumb: String
}

