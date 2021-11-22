//
//  Upcoming+CoreDataProperties.swift
//  Diplom
//
//  Created by ryan on 22.11.2021.
//
//

import Foundation
import CoreData

@objc(Upcoming)
public class Upcoming: NSManagedObject {

    @NSManaged public var backdrop_path: String?
    @NSManaged public var id: Int32
    @NSManaged public var original_language: String?
    @NSManaged public var original_title: String?
    @NSManaged public var overview: String?
    @NSManaged public var popularity: Float
    @NSManaged public var poster_path: String?
    @NSManaged public var release_date: String?
    @NSManaged public var title: String?
    @NSManaged public var vote_average: Double
    @NSManaged public var vote_count: Int32

}
