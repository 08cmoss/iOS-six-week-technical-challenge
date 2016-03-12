//
//  EntityController.swift
//  sixWeekChallenge
//
//  Created by Cameron Moss on 3/11/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//

import Foundation
import CoreData

class EntityController {
    
    
    
    private let entityKey = "entityKey"
    
    static let sharedController = EntityController()
    
    var peopleArray: [Person] {
        let request = NSFetchRequest(entityName: "Person")
        let moc = Stack.sharedStack.managedObjectContext
        
        do {
            return try moc.executeFetchRequest(request) as! [Person]
        } catch {
            return []
        }
    }
    
    
    func addPerson(person: Person) {
        
        self.saveToPersistentStorage()
    }
    
    func removePerson(person: Person) {
        
        person.managedObjectContext?.deleteObject(person)
    }
    
    
    
    func saveToPersistentStorage() {
        
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving managed object context")
        }
        
    }
    
    
    func filePath(key: String) -> String {
        let directorySearchResults = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.AllDomainsMask, true)
        let documentsPath: AnyObject = directorySearchResults[0]
        let entityPath = documentsPath.stringByAppendingString("/\(key).plist")
        
        return entityPath
    }
    
    
    func shuffleArray<Person>(var array: [Person]) -> [Person] {
        for index in (0..<array.count) {
            let randomIndex = Int(arc4random_uniform(UInt32(index)))
            (array[index], array[randomIndex]) = (array[randomIndex], array[index])
        }
        
        return array
    }
}
