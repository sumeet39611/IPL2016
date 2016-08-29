//
//  PlayerInfoViewController.swift
//  IPL2016
//
//  Showing Player Information
//
//  Created by Sumeet on 25/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class PlayerInfoViewController: UIViewController
{
    // row index of player selected
    var mIndexPlayer : Int = 0
    
    //row index of team selected
    var mIndexTeam : Int = 0

    //outlet of player name UILabel
    @IBOutlet weak var nameLabel: UILabel!
    
    //outlet of DOB UILabel
    @IBOutlet weak var dobLabel: UILabel!
    
    //outlet of nationality UILabel
    @IBOutlet weak var nationalityLabel: UILabel!
    
    //outlet of role UILabel
    @IBOutlet weak var roleLabel: UILabel!
    
    //outlet of battingStyle UILabel
    @IBOutlet weak var battingStyleLabel: UILabel!
    
    //outlet of bowlingStyle UILabel
    @IBOutlet weak var bowlingStyleLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //getting reference of firebase database
        let ref = FIRDatabase.database().reference()
        
        //loading data
        ref.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            
            // reading firebase database
            let fullInfo = snapshot.value!["IPL"] as! NSArray
            let teamInfo = fullInfo.objectAtIndex(self.mIndexTeam) as! NSDictionary
            let Info = teamInfo.objectForKey("team_players") as! NSArray
            let playerInfo = Info.objectAtIndex(self.mIndexPlayer) as! NSDictionary
            
            //setting player name
            self.nameLabel.text = playerInfo.objectForKey("player_name") as? String
            
            //setting player DOB
            self.dobLabel.text = playerInfo.objectForKey("player_dob") as? String
            
            //setting player nationality
            self.nationalityLabel.text = playerInfo.objectForKey("player_nationality") as? String
            
            //setting player role
            self.roleLabel.text = playerInfo.objectForKey("player_role") as? String
            
            //setting player batting style
            self.battingStyleLabel.text = playerInfo.objectForKey("player_batting_style") as? String
            
            //setting player bowling style
            self.bowlingStyleLabel.text = playerInfo.objectForKey("player_bowling_style") as? String
            
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
