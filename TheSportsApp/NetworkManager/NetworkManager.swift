//
//  NetworkManager.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 19/06/2022.
//

import Foundation

class NetworkManager: ApiServices {
    
    
    func fetch<T: Codable>(endPoint: String, SportsAppModel: T.Type) async throws -> T {
        
        let url = URL(string: UrlServices(endPoint: endPoint).url)
        let defaultUrl = URL(string: UrlServices(endPoint: "api/v1/json/2/search_all_leagues.php?s=skiing").url)
        let (data,_) = try await URLSession.shared.data(from: url ?? defaultUrl!)
        let sportsArray = try JSONDecoder().decode(T.self, from: data)
        return sportsArray
    
        }
    }
    
