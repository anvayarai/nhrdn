//
//  EventDetailsViewController.swift
//  
//
//  Created by Stacks and Queues on 23/06/16.
//
//

import UIKit

class EventDetailsViewController: UIViewController {
  
    @IBOutlet weak var lb_author: UILabel!
    @IBOutlet weak var tv_title: UITextView!
    @IBOutlet weak var lb_email: UILabel!
    @IBOutlet weak var lb_company_name: UILabel!
    @IBOutlet weak var lb_description: UILabel!
//    @IBOutlet weak var lb_author: UILabel!
//    @IBOutlet weak var lb_company_name: UILabel!
//    @IBOutlet weak var lb_email: UILabel!
    @IBOutlet weak var lb_start_date: UILabel!
    @IBOutlet weak var lb_end_date: UILabel!
    @IBOutlet weak var lb_start_time: UILabel!
    @IBOutlet weak var lb_end_time: UILabel!
    @IBOutlet weak var lb_likes: UILabel!
    @IBOutlet weak var lb_venue: UILabel!
    
    var event_name=String()
    var event_description=String()
    var event_author=String()
    var event_company_name=String()
    var event_email=String()
    var event_start_date=String()
    var event_end_date=String()
    var event_start_time=String()
    var event_end_time=String()
    var event_likes=String()
    var event_venue=String()
  
    @IBOutlet weak var btn_like_outlet: UIButton!
    @IBAction func btn_share(sender: AnyObject) {
        let shareText = "Hello, world!"
        let vc = UIActivityViewController(activityItems: [shareText], applicationActivities: [])
        presentViewController(vc, animated: true, completion: nil)
    }

    @IBOutlet weak var lb_total_likes: UILabel!
    var count=1
    @IBAction func btn_like(sender: AnyObject) {
        
        if count==0{
            btn_like_outlet.setImage(UIImage(named: "like"), forState: .Normal)
            btn_like_outlet.tintColor=UIColor.blackColor()
            count=1
            
        }
        else if count==1{
            btn_like_outlet.setImage(UIImage(named: "like"), forState: .Normal)
            btn_like_outlet.tintColor = UIColor.blueColor()
            count=0
            
        }
        
    }
   
    var event:ParticipateObject!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
       
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        
        tv_title.text="Title:\n\(event_name)"
        lb_description.text=event_description
        lb_author.text="Event Created By :  \(event_author)"
  lb_company_name.text="Company name    : \(event_company_name)"
         lb_email.text="Email : \(event_email)"
        lb_start_date.text="Start Date : \(event_start_date)"
          lb_end_date.text="End Date   : \(event_end_date)"
        lb_start_time.text="Start Time : \(event_start_time)"
          lb_end_time.text="End Time   : \(event_end_time)"
             lb_likes.text="Total likes : \(event_likes)"
             lb_venue.text="Venue      : \(event_venue)"
        lb_total_likes.text="(\(event_likes))"
        let image : UIImage = UIImage(named: "like")!
        
        btn_like_outlet.setImage(image, forState: .Normal)
        btn_like_outlet.tintColor=UIColor.blackColor()
        //[btn_like_outlet.setImage:image, forState: UIControlState.Normal];
        btn_like_outlet.contentVerticalAlignment=UIControlContentVerticalAlignment.Fill
        btn_like_outlet.contentHorizontalAlignment=UIControlContentHorizontalAlignment.Fill
        
        

        
//        event_title.text=event_name
//        event_description.text=event_description_string
//        print("hello\(event_name)")
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
