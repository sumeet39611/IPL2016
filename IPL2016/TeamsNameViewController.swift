//
//  TeamsNameViewController.swift
//  IPL2016
//
//  Showing Team Names and Logos
//
//  Created by Sumeet on 22/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class TeamsNameViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    //object of Controller
    var controllerObj = Controller()
    
    //outlet of UITableView
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //getting no. of rows
        controllerObj.getNoOfRows()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("reload:"), name: "notificationIdentifier", object: nil)

        // Do any additional setup after loading the view.
    }

    //reloading tableview
    func reload(notification : NSNotification)
    {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Number of rows in table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return controllerObj.mRows
    }
    
    //getting each cell information
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath:indexPath) as! CustomCell
       
        //activityIndicatorView started animating
        cell.activityIndicatorView.startAnimating()
        
        //putting dummy data on label
        cell.teamName.text = "name"
        
        //putting dummy image on imageView
        cell.teamImage.image = UIImage(named: "dummy")

        //getting team names and logos
        controllerObj.getTeamNameData(indexPath.row , callback: { (Result, Result1) -> Void in
            cell.teamName.text = Result
            cell.teamImage.image = Result1
            
            //activityIndicatorView stopped after loading data
            cell.activityIndicatorView.stopAnimating()
        })
        return cell
    }
    
    //passing value of selected team row to TeamsInfoViewController
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        //checking with identifier
        if (segue.identifier == "gotoTeamInfo")
        {
            //getting selected row
            let selectedRowIndex = self.tableView.indexPathForSelectedRow!
            
            // initialize new view controller and cast it as your view controller
            let destination = segue.destinationViewController as! TeamsInfoViewController
           
            //passing value here
            destination.mRowIndex = selectedRowIndex.row
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
