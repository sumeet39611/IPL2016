//
//  TeamsInfoViewController.swift
//  IPL2016
//
//  Created by BridgeLabz on 24/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class TeamsInfoViewController: UIViewController
{
   
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
    
    var rowIndex : Int = 0
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        let ref = FIRDatabase.database().reference()
        
        //loading data
        ref.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
        
            // reading firebase database
            let fullInfo = snapshot.value!["IPL"] as! NSArray
            let teamInfo = fullInfo.objectAtIndex(self.rowIndex) as! NSDictionary
            
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if (segue.identifier == "gotoPlayerName")
        {
            let selectedRowIndex = self.rowIndex
            
            // initialize new view controller and cast it as your view controller
            let destination = segue.destinationViewController as! PlayersNameViewController
            
            destination.rowIndexPlayer = selectedRowIndex
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
