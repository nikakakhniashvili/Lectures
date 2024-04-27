//
//  Country.swift
//  Lecture 21
//

import Foundation

struct Country: Decodable {
    
    let capital: String
    let region: String
    let subregion: String
    let area: Int
    let continents: String
    let startOfWeek: String
    let name: Name
    let flags: Flags
    
    var imageURL: URL? {
        return URL(string: "https://flagcdn.com/w320/ge.png")
    }
    
    
    struct Name: Decodable {
        let common: String
    }
    
    struct Flags: Decodable {
        let alt: String
    }
    
    struct Image: Decodable {
        let png: String
    }
}
