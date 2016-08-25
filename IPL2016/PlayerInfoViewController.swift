//
//  PlayerInfoViewController.swift
//  IPL2016
//
//  Created by BridgeLabz on 25/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class PlayerInfoViewController: UIViewController
{
    var index1 : Int = 0
    var index2 : Int = 0

    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var dobLabel: UILabel!
    
    
    @IBOutlet weak var nationalityLabel: UILabel!
    
    
    @IBOutlet weak var roleLabel: UILabel!
    
    
    @IBOutlet weak var battingStyleLabel: UILabel!
    
    
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
        
        let ref = FIRDatabase.database().reference()
        
        //loading data
        ref.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            
            // reading firebase database
            let fullInfo = snapshot.value!["IPL"] as! NSArray
            let teamInfo = fullInfo.objectAtIndex(self.index2) as! NSDictionary
            
            //getting team name here
            let Info = teamInfo.objectForKey("team_players") as! NSArray
            let playerInfo = Info.objectAtIndex(self.index1) as! NSDictionary
            //print(playerInfo)
           // name = playerInfo.objectForKey("player_name") as? String
            //print(name)
            
            
            
            //setting team name
            self.nameLabel.text = playerInfo.objectForKey("player_name") as? String
            
            //setting captain name
            self.dobLabel.text = playerInfo.objectForKey("player_dob") as? String
            
            //setting coach name
            self.nationalityLabel.text = playerInfo.objectForKey("player_nationality") as? String
            
            //setting home venue
            self.roleLabel.text = playerInfo.objectForKey("player_role") as? String
            
            //setting owner name
            self.battingStyleLabel.text = playerInfo.objectForKey("player_batting_style") as? String
            
            //setting owner name
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
