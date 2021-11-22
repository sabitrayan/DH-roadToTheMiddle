//
//  UpcomingServiceModel.swift
//  Diplom
//
//  Created by ryan on 22.11.2021.
//

import Foundation

// MARK: Struct to pass restApi to coreData to Cache App
struct UpcomingServiceModel : Codable {
//    let adult : Bool
    let backdrop_path : String
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Float
    let poster_path: String
    let release_date: String
    let title: String
    let vote_average: Double
    let vote_count: Int

    // MARK: DBManager to managed the local data base
    static let database = DatabaseHandler.shared

    // MARK: Store to added data to  local data base
    func store() {
        guard let movies = UpcomingServiceModel.database.add(Upcoming.self) else {
            return
        }
//        let moviesId = movies.id
//        guard let id = moviesId as Int32? else {
//            return
//        }
//        if id == 0 {return}
//        let predicate = NSPredicate.init(format: "id == %i", id)


        movies.backdrop_path = backdrop_path
        movies.id = Int32(id)
        movies.original_language = original_language
        movies.original_title = original_title
        movies.overview = overview
        movies.popularity = popularity
        movies.poster_path = poster_path
        movies.release_date = release_date
        movies.title = title
        movies.vote_average = vote_average
        movies.vote_count = Int32(vote_count)

        UpcomingServiceModel.database.save()
    }

}
