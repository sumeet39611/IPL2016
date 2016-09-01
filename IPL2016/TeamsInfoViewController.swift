//
//  TeamsInfoViewController.swift
//  IPL2016
//
//  Showing Team Information
//
//  Created by Sumeet on 24/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class TeamsInfoViewController: UIViewController
{
    //initialised row index of team selected
    var mRowIndex : Int = 0
    
    //outlet of name  UILabel
    @IBOutlet weak var nameLabel: UILabel!
    
    //outlet of captain  UILabel
    @IBOutlet weak var captainLabel: UILabel!
    
    //outlet of coach  UILabel
    @IBOutlet weak var coachLabel: UILabel!
    
    //outlet of home venue  UILabel
    @IBOutlet weak var homeVenueLabel: UILabel!
    
    //outlet of owner UILabel
    @IBOutlet weak var ownerLabel: UILabel!
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        //getting reference of firebase database
        let ref = FIRDatabase.database().reference()
        
        //loading data
        ref.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
        
            // reading firebase database
            let fullInfo = snapshot.value!["IPL"] as! NSArray
            let teamInfo = fullInfo.objectAtIndex(self.mRowIndex) as! NSDictionary
            
            //setting team name
            self.nameLabel.text = teamInfo.objectForKey("team_name") as? String
            
            //setting captain name
            self.captainLabel.text = teamInfo.objectForKey("team_captain") as? String
            
            //setting coach name
            self.coachLabel.text = teamInfo.objectForKey("team_coach") as? String
            
            //setting home venue
            self.homeVenueLabel.text = teamInfo.objectForKey("team_home_venue") as? String
            
            //setting owner name
            self.ownerLabel.text = teamInfo.objectForKey("team_owner") as? String
        })
        
        
    }
    
    //passing value of row index team selected to PlayersNameViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        //checking identifier
        if (segue.identifier == "gotoPlayerName")
        {
            // initialize new view controller and cast it as your view controller
            let destination = segue.destinationViewController as! PlayersNameViewController
            
            //passing value of row index team selected
            destination.mRowIndexTeam = self.mRowIndex
        }
    }

    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
