//
//  ListTableViewController.swift
//  sixWeekChallenge
//
//  Created by Cameron Moss on 3/11/16.
//  Copyright © 2016 Cameron Moss. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    
    var people: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
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
        return EntityController.sharedController.peopleArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("entityCell", forIndexPath: indexPath)
        
        let item = EntityController.sharedController.peopleArray[indexPath.row]
        
        cell.textLabel?.text = item.firstName! + " " + item.lastName!
        //cell.updateWith(person)
        return cell
    }
    
    
    @IBAction func randomButtonTapped(sender: AnyObject) {
        let random1 = arc4random_uniform(UInt32(EntityController.sharedController.peopleArray.count))
        print(random1)
        let random2 = arc4random_uniform(UInt32(EntityController.sharedController.peopleArray.count))
        print(random2)
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let person = EntityController.sharedController.peopleArray[indexPath.row]
            EntityController.sharedController.removePerson(person)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            EntityController.sharedController.saveToPersistentStorage()
        }
    }
    

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
                    pairedListTableViewController.updateWith(EntityController.sharedController.peopleArray[selectedRow])
                }
            }
        }

    }
    

}
