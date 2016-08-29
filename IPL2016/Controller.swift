//
//  Controller.swift
//  IPL2016
//
//  Controller for reading teams and players data from firebase
//
//  Created by Sumeet on 22/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class Controller: NSObject
{
    //getting team names and logos using callback mechanism
    func getTeamNameData(indexPath : Int, callback: (Result : String, Result1 : UIImage) -> Void)
    {
        //getting reference url of firebase database
        let ref = FIRDatabase.database().reference()
        //print(ref)
        
        var name : String?
        var photo : UIImage?
        
        //loading data
        ref.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            
            // reading firebase database
            let fullInfo = snapshot.value!["IPL"] as! NSArray
            let teamInfo = fullInfo.objectAtIndex(indexPath) as! NSDictionary
            
            //getting team name 
            name = teamInfo.objectForKey("team_name") as? String
            
            //url of team logo
            let urlString = teamInfo.objectForKey("team_image_url") as? String
          
            //getting team logo
            photo = UIImage(data: NSData(contentsOfURL: NSURL(string:urlString!)!)!)
            
            callback(Result: name!, Result1: photo!)
            
            }){ (error) in
                print(error.localizedDescription)
        }
    }
    
    //getting player names and profile pics using callback mechanism
    func getPlayerNameData(index : Int,indexPath : Int, callback: (Result : String, Result1 : UIImage) -> Void)
    {
        //getting reference url of firebase database
        let ref = FIRDatabase.database().reference()
        
        var name : String?
        var photo : UIImage?
        
        //loading data
        ref.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            
            // reading firebase database
            let fullInfo = snapshot.value!["IPL"] as! NSArray
            let teamInfo = fullInfo.objectAtIndex(index) as! NSDictionary
            let Info = teamInfo.objectForKey("team_players") as! NSArray
            let playerInfo = Info.objectAtIndex(indexPath) as! NSDictionary
            
            //getting player name
            name = playerInfo.objectForKey("player_name") as? String
            
            //url of player profile pic
            let urlString = playerInfo.objectForKey("player_img_url") as? String
            
            //getting player profile pic
            photo = UIImage(data: NSData(contentsOfURL: NSURL(string:urlString!)!)!)
            
            callback(Result: name!, Result1: photo!)
            
            }){ (error) in
                print(error.localizedDescription)
        }
    }
}
