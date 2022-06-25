//
//  SportsViewModel.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 20/06/2022.
//

import Foundation

class SportsViewModel {
    let apiService: ApiServices
    var sports = [SportsModel]()
    init(apiService: ApiServices = NetworkManager()) {
        self.apiService = apiService
    }
    func fetchSports() async -> [SportsModel]? {
        let sports = try? await apiService.fetch(endPoint: "api/v1/json/2/all_sports.php", SportsAppModel: Sports.self)
        return sports?.sports
    }
    
}

