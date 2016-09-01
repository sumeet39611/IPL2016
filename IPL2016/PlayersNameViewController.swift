//
//  PlayersNameViewController.swift
//  IPL2016
//
//  Showing players name and profile pic
//
//  Created by Sumeet on 24/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class PlayersNameViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    //object of Controller
    var controllerObj = Controller()
    
    // row index of team selected
    var mRowIndexTeam : Int = 0
    
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
        return 10
    }
    
    //getting each cell information
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cellPlayer", forIndexPath:indexPath) as! CustomCellPlayer
        
        //activityIndicatorView started animating
        cell.activityIndicatorView.startAnimating()
        
        //putting dummy data on label
        cell.playerName.text = "name"
        
        //putting dummy image on imageView
        cell.playerImage.image = UIImage(named: "dummy")
        
        //getting player names and profile pics
        controllerObj.getPlayerNameData(self.mRowIndexTeam, indexPath:indexPath.row , callback: { (Result, Result1) -> Void in
            cell.playerName.text = Result
            cell.playerImage.image = Result1
            
            //activityIndicatorView stopped after loading data
            cell.activityIndicatorView.stopAnimating()
        })
        return cell
    }
    
    //passing value of row index of player and team selected to PlayerInfoViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        //checking with identifier
        if (segue.identifier == "gotoPlayerInfo")
        {
            //getting selected row for player
            let selectedRowIndex = self.tableView.indexPathForSelectedRow!
            
            // initialize new view controller and cast it as your view controller
            let destination = segue.destinationViewController as! PlayerInfoViewController
            
            //passing value of row index player selected
            destination.mIndexPlayer = selectedRowIndex.row
            
            //passing value of row index team selected
            destination.mIndexTeam = self.mRowIndexTeam
        }
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
