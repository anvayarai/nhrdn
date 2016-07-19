//
//  TabParticipate.swift
//  nhrdn
//
//  Created by Stacks and Queues on 15/06/16.
//  Copyright © 2016 Stacks and Queues. All rights reserved.
//

import UIKit
import SwiftyJSON

class TabParticipate: UIViewController, UITableViewDelegate ,UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    // MARK: Properties
    //defining an array with name Array.
    var Array = [ParticipateObject]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        // Load the sample data.
        //loadSampleMeals()
     partcipateDataCommunication()
        
        tableview.dataSource = self
        tableview.delegate=self
        //parseJson()

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
    func parseJson(json:JSON){
        
      
        
        //Initialising a variable index with value 0 which increments in repeat loop.
        var index: Int = 0
        
        //repeat loop same as do while in other languages
        repeat{
            
            print(json)
            
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
    
    //New
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == "showDetails",
            let destination = segue.destinationViewController as? EventDetailsViewController,
            blogIndex = tableview.indexPathForSelectedRow?.row
            
        {
            destination.event_name = Array[blogIndex].event_title
            destination.event_description = Array[blogIndex].event_description
            destination.event_author=Array[blogIndex].event_author
            destination.event_company_name=Array[blogIndex].event_company_name

            destination.event_start_date=Array[blogIndex].event_start_date
            destination.event_end_date=Array[blogIndex].event_end_date
            destination.event_start_time=Array[blogIndex].event_start_time
            destination.event_end_time=Array[blogIndex].event_end_time
            destination.event_likes=Array[blogIndex].event_likes
            destination.event_venue=Array[blogIndex].event_venue
            destination.event_email=Array[blogIndex].event_email

            
            print("\(destination.event_name)")
        }
    }
    
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //this function will return number of sections in a table
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return Array.count
        //return meals.count
    }
    
    //defines the content of each individual cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CardParticipateTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as!  CardParticipateTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let meal = Array[indexPath.row]
        
        cell.event_type.text = meal.event_type
        cell.event_title.text=meal.event_title
        cell.event_description.text=meal.event_description
        
        if(meal.require_like=="1"){
            
          

            
            let image : UIImage = UIImage(named: "like")!
            print("The loaded image: \(image)")
            cell.iv_like.image = image
        }
        
        else{
            cell.iv_like.hidden = true
        }
       
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //CODE TO BE RUN ON CELL TOUCH
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        print(Array[row])
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
            self.tableview.reloadData()
            
            return
        })
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
