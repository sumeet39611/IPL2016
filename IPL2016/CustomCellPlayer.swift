//
//  CustomCellPlayer.swift
//  IPL2016
//
//  Creating customCell for PlayersNameViewController
//
//  Created by Sumeet on 24/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class CustomCellPlayer: UITableViewCell
{
    //outlet of player name UILabel
    @IBOutlet weak var playerName: UILabel!

    //outlet of player image UILabel
    @IBOutlet weak var playerImage: UIImageView!
    
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
