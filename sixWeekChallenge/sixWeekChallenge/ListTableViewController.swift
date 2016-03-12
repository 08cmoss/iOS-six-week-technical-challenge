//
//  ListTableViewController.swift
//  sixWeekChallenge
//
//  Created by Cameron Moss on 3/11/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//

//

import UIKit

class ListTableViewController: UITableViewController {
    
    
    @IBOutlet var myTableView: UITableView!
    var randomArray = EntityController.sharedController.shuffleArray(EntityController.sharedController.peopleArray)
    //var people: [Person] = []
    var people: [Person] {
        return EntityController.sharedController.peopleArray
    }
    var random: Bool = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.reloadData()

    }
    
    override func viewWillAppear(animated: Bool) {
        myTableView.reloadData()
        print(randomArray.count)
        random = false
    }
   
    override func viewDidAppear(animated: Bool) {
        //super.viewDidAppear(animated)
        //myTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return random ? randomArray.count:people.count
        //EntityController.sharedController.peopleArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entityCell", forIndexPath: indexPath) 
        
        let items = random ? randomArray[indexPath.row]:people[indexPath.row]
        //EntityController.sharedController.peopleArray[indexPath.row]
        
        cell.textLabel?.text = items.firstName! + " " + items.lastName!
        let pair = indexPath.row/2
        if pair % 2 == 0 {
            cell.backgroundColor = UIColor.cyanColor()
        } else {
            cell.backgroundColor = UIColor.brownColor()
        }
        
        return cell
    }
    
    
    @IBAction func randomButtonTapped(sender: AnyObject) {
        //viewDidAppear(true)
        
        randomArray = EntityController.sharedController.shuffleArray(people)
        random = true
        myTableView.reloadData()
        
    }
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let person = randomArray[indexPath.row]
            EntityController.sharedController.removePerson(person)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            EntityController.sharedController.saveToPersistentStorage()
            
        }
    }
*/
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toPairsSegue" {
            let destinationViewController = segue.destinationViewController as? PairedListTableViewController
            if let pairedListTableViewController = destinationViewController {
                _ = pairedListTableViewController.view
                
                if let selectedRow = tableView.indexPathForSelectedRow?.row {
                    pairedListTableViewController.updateWith(people[selectedRow])
                }
            }
        }

    }
    

}




