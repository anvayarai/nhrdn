//
//  ParticipateObject.swift
//  nhrdn
//
//  Created by Stacks and Queues on 16/06/16.
//  Copyright © 2016 Stacks and Queues. All rights reserved.
//

import UIKit

class ParticipateObject{

    // MARK: Properties
    
    var event_type: String
    var event_title: String
    var event_description: String
    var require_like: String
    var event_author: String
    var event_company_name: String
    var event_email: String
    var event_start_date: String
    var event_end_date: String
    var event_start_time: String
    var event_end_time: String
    var event_likes: String
    var event_venue: String

    
    // MARK: Initialization
    
    init?(event_type: String, event_title:String, event_description:String, event_author: String,event_company_name: String,event_email: String,event_start_date: String,event_end_date: String,event_start_time: String,event_end_time: String,event_likes: String,event_venue: String,require_like:String) {
        // Initialize stored properties.
//        self.name = name
//        self.photo = photo
//        self.rating = rating
        self.event_type=event_type
        self.event_title=event_title
        self.event_description=event_description
        self.require_like=require_like
        self.event_author=event_author
        self.event_company_name=event_company_name
        self.event_email=event_email
        self.event_start_date=event_start_date
        self.event_end_date=event_end_date
        self.event_start_time=event_start_time
        self.event_end_time=event_end_time
        self.event_likes=event_likes
        self.event_venue=event_venue
        
        // Initialization should fail if there is no name or if the rating is negative.
        if event_title.isEmpty || event_type.isEmpty || event_description.isEmpty || require_like.isEmpty{
            return nil
        }
    }
    


}
