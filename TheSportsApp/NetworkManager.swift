//
//  NetworkManager.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 19/06/2022.
//

import Foundation

class NetworkManager: ApiServices {
    
    
    func fetchSports<T: Codable>(endPoint: String, SportsAppModel: T.Type) async throws -> T {
        
        let url = URL(string: UrlServices(endPoint: endPoint).url)
        let (data,_) = try await URLSession.shared.data(from: url!)
        let sportsArray = try JSONDecoder().decode(T.self, from: data)
        return sportsArray
    
        }
    }
    
