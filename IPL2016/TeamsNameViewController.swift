//
//  TeamsNameViewController.swift
//  IPL2016
//
//  Created by BridgeLabz on 22/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit
import Firebase

class TeamsNameViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    
    //outlet of UITableView
    @IBOutlet weak var tableView: UITableView!
    
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
    
    //Number of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 8
    }
    
    //getting each cell information
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
    
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath) as! CustomCell
        
        //getting reference url of firebase database
        let ref = FIRDatabase.database().reference()
      
        //loading data
        ref.observeSingleEventOfType(.Value, withBlock: { (snapshot) in
            // Get user value
            let fullInfo = snapshot.value!["IPL"] as! NSArray
            let teamInfo = fullInfo.objectAtIndex(indexPath.row) as! NSDictionary
            let name = teamInfo.objectForKey("team_name") as! String
            
            //adding team name
            cell.teamName.text = name
            })
        
        return cell
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
