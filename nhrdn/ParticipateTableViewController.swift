//
//  ParticipateTableViewController.swift
//  nhrdn
//
//  Created by Stacks and Queues on 21/06/16.
//  Copyright © 2016 Stacks and Queues. All rights reserved.
//

import UIKit
import SwiftyJSON

class ParticipateTableViewController: UITableViewController {
    // MARK: Properties
    //defining an array with name Array.
    var Array = [ParticipateObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        partcipateDataCommunication()
//        parseJson()
        
        // Do any additional setup after loading the view.
    }
    
    func partcipateDataCommunication(){
        let myUrl = NSURL(string: "http://demo.expresscion.in/nhrdn/mobile/tab.php")
        let request = NSMutableURLRequest(URL:myUrl!)
        request.HTTPMethod = "POST"
        
        // Compose a query string
        let postString =  "user_unique_name=y1&tab_type=participate"
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }
            
            let urlJson = JSON(data: data!)
            self.parseJson(urlJson)
        }
        task.resume()
    }
    
    
    //
    //    //defining an array with name chapterList.
    //    var chapterList = [String]()
    
    //parsing data with json
    func parseJson(urljson:JSON){
        
        //NSURL containing location of remote server
        //let chapterUrl = NSURL(string: "http://demo.expresscion.in/nhrdn/mobile/chapter_type.php")!
        //NSData for getting the content from the remote server.
        //let data = NSData(contentsOfURL: chapterUrl)
        
        //print("START")
        //print(data?.description)
        
        //making a contant json which stores json data coming from NSData
        //let json = JSON(data: data!)
        let json=urljson
        //Initialising a variable index with value 0 which increments in repeat loop.
        var index: Int = 0
        
        //repeat loop same as do while in other languages
        repeat{
            
            //parsing json
            
            // Adding value to constructor of ParticipateObject
            let participateObject=ParticipateObject(event_type:json["events"][index]["event_type"].string!,event_title: json["events"][index]["event_title"].string!,
                                                    event_description: json["events"][index]["event_description"].string!,
                                                    event_author:json["events"][index]["user_organisation"].string!,
                                                    event_company_name:json["events"][index]["user_organisation"].string!,
                                                    event_email:json["events"][index]["email"].string!,event_start_date:json["events"][index]["start_date"].string!,
                                                    event_end_date:json["events"][index]["close_date"].string!,
                                                    event_start_time:json["events"][index]["start_time"].string!,
                                                    event_end_time:json["events"][index]["close_time"].string!,
                                                    event_likes:json["events"][index]["like_post"].string!,event_venue:json["events"][index]["venue"].string!,require_like:json["events"][index]["require_like"].string!)
            //inserting all chapter type in the array[] named Array.
            //saving all values after parse in the array named Array
            Array.append(participateObject!)
            
            
            
            
            index += 1
        } while(index < json["events"].count)
        do_table_refresh()
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
        return Array.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CardParticipateTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CardParticipateTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        //let meal = Array[indexPath.row]
        
//        cell.event_type.text=meal.event_type
//        cell.event_title.text=meal.event_title
        
//        cell.nameLabel.text = meal.name
//        cell.photoImageView.image = meal.photo
//        cell.ratingControl.rating = meal.rating
        
        return cell
        
        
        

        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
    }
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableView.reloadData()
            return
        })
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
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
