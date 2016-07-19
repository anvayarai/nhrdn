//
//  CardParticipateTableViewCell.swift
//  nhrdn
//
//  Created by Stacks and Queues on 16/06/16.
//  Copyright © 2016 Stacks and Queues. All rights reserved.
//

import UIKit

class CardParticipateTableViewCell: UITableViewCell {
    //Connecting the cell layout with this custom class.
    @IBOutlet weak var iv_like: UIImageView!
//    @IBOutlet weak var event_type: UILabel!
    @IBOutlet weak var iv_share: UIImageView!
    @IBOutlet weak var iv_register: UIImageView!
    @IBOutlet weak var iv_rating: UIImageView!
//    @IBOutlet weak var event_description: UILabel!
//   
//    @IBOutlet weak var event_title: UILabel!
    @IBOutlet weak var event_title: UILabel!
    @IBOutlet weak var event_description: UILabel!
    @IBOutlet weak var event_type: UILabel!
    @IBOutlet weak var number_of_likes: UILabel!

   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
