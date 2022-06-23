//
//  LeaguesViewModel.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 20/06/2022.
//

import Foundation

class LeaguesViewModel {
    
   
    let apiService: ApiServices
    init(apiService: ApiServices = NetworkManager()) {
        self.apiService = apiService
    }
    
    func fetchLeagues(sportName: String) async -> [LeaguesModel]? {
        let leagues = try? await apiService.fetch(endPoint: "api/v1/json/2/search_all_leagues.php?s=\(sportName)", SportsAppModel: Leagues.self)
        return leagues?.countries
    }
    
}





    
    
