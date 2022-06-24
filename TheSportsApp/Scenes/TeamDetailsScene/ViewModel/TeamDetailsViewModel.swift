//
//  TeamDetailsViewModel.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 24/06/2022.
//

import Foundation

class TeamDetailsViewModel {
    
    let apiService: ApiServices
    init(apiService: ApiServices = NetworkManager()) {
        self.apiService = apiService
    }
    
    func fetchTeamDetails() async -> [UpcomingEventsModel]? {
        let upcomingEvents = try? await apiService.fetch(endPoint: "api/v1/json/2/eventsseason.php?id=5107", SportsAppModel: UpcomingEvents.self)
        return upcomingEvents?.events
        }
}
