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

    func fetch() async -> [LeaguesModel]? {
        let leagues = try? await apiService.fetchSports(endPoint: "api/v1/json/2/all_leagues.php", SportsAppModel: Leagues.self)
        return leagues?.leagues
    }
}
