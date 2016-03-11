//
//  Person.swift
//  sixWeekChallenge
//
//  Created by Cameron Moss on 3/11/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//

import Foundation
import CoreData


class Person: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    convenience init(firstName: String, lastName: String, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.firstName = firstName
        self.lastName = lastName
        
        
    }


}
