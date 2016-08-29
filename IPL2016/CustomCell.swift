//
//  CustomCell.swift
//  IPL2016
//
//  Creating customCell for TeamsNameViewController
//
//  Created by Sumeet on 22/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell
{
    //outlet of UILabel
    @IBOutlet weak var teamName: UILabel!
    
    //outlet of UIImageView
    @IBOutlet weak var teamImage: UIImageView!
    
    //outlet of UIActivityIndicatorView
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
