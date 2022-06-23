//
//  ApiServices.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 19/06/2022.
//

import Foundation

protocol ApiServices {
    func fetch<T: Codable>(endPoint: String, SportsAppModel: T.Type) async throws -> T
}
