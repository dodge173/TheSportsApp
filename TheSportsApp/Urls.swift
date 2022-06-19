//
//  Urls.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 19/06/2022.
//

import Foundation

struct UrlServices {
    
    var endPoint: String = ""
    var url: String {
        return "https://www.thesportsdb.com/\(endPoint)"
    }
}
