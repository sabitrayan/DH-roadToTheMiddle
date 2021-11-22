//
//  Search.swift
//  Diplom
//
//  Created by ryan on 22.11.2021.
//

import Foundation

//    MARK: - Model Decodable to search Reasults to implemented searchBar Online
struct SearchResult: Decodable {
    let page : Int
    let results: [Results]
}

struct Results: Decodable {
    let poster_path: String
    let title: String
    let vote_average: Double
    let release_date: String
}
