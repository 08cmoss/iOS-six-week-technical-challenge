//
//  Person+CoreDataProperties.swift
//  sixWeekChallenge
//
//  Created by Cameron Moss on 3/11/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Person {

    @NSManaged var firstName: String?
    @NSManaged var lastName: String?
    @NSManaged var isPaired: NSNumber?

}
