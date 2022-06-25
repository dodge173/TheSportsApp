//
//  LeagueDetailsViewModel.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 22/06/2022.
//

import Foundation


class LeagueDetailsViewModel {
    
    
    let apiService: ApiServices
    init(apiService: ApiServices = NetworkManager()) {
        self.apiService = apiService
    }
    
    func fetchUpcomingEvents(leagueID: String) async -> [UpcomingEventsModel]? {
        let upcomingEvents = try? await apiService.fetch(endPoint: "api/v1/json/2/eventsseason.php?id=\(leagueID)", SportsAppModel: UpcomingEvents.self)
        return upcomingEvents?.events
        }
    
    func fetchLatestResults(leagueID: String) async -> [LatestResultsModel]? {
        let latestResults = try? await apiService.fetch(endPoint: "api/v1/json/2/eventsseason.php?id=\(leagueID)", SportsAppModel: LatestResults.self)
        return latestResults?.events
    }
    
    func fetchTeams() async -> [TeamsModel]? {
        let teams = try? await apiService.fetch(endPoint: "api/v1/json/2/search_all_teams.php?l=English%20Premier%20League", SportsAppModel: Teams.self)
        return teams?.teams
    }
    
}
