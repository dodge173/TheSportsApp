//
//  SportsViewModel.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 20/06/2022.
//

import Foundation

class SportsViewModel {
    
    let apiService: ApiServices
    init(apiService: ApiServices = NetworkManager()) {
        self.apiService = apiService
    }
    
    func fetch() async -> [SportsModel]? {
        let sports = try? await apiService.fetchSports(endPoint: "api/v1/json/2/all_sports.php", SportsAppModel: Sports.self)
        return sports?.sports
    }
    
}

