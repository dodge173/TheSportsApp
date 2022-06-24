//
//  UpcomingEventsModel.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 22/06/2022.
//

import Foundation


struct UpcomingEvents: Codable {
    let events: [UpcomingEventsModel]
}
// MARK: - League
struct UpcomingEventsModel: Codable {
    let strEvent, strTime, dateEvent: String?
}
