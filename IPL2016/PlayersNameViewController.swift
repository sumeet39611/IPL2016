//
//  PlayersNameViewController.swift
//  IPL2016
//
//  Created by BridgeLabz on 24/08/16.
//  Copyright © 2016 com.bridgeLabz. All rights reserved.
//

import UIKit

class PlayersNameViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{

    //object of Controller
    var controllerObj = Controller()
    
    var rowIndexPlayer : Int = 0
    
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
        return 5
    }
    
    //getting each cell information
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cellPlayer", forIndexPath:indexPath) as! CustomCellPlayer
        
        //putting dummy data on label
        cell.playerName.text = "name"
        
        //putting dummy image on imageView
        cell.playerImage.image = UIImage(named: "dummy")
        
        //getting player names and profile pics
        controllerObj.getPlayerNameData(self.rowIndexPlayer, indexPath:indexPath.row , callback: { (Result, Result1) -> Void in
            cell.playerName.text = Result
            cell.playerImage.image = Result1
        })
        
        return cell

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        //checking with identifier
        if (segue.identifier == "gotoPlayerInfo")
        {
            //getting selected row
            let selectedRowIndex = self.tableView.indexPathForSelectedRow!
            
            // initialize new view controller and cast it as your view controller
            let destination = segue.destinationViewController as! PlayerInfoViewController
            
            //passing value here
            destination.index1 = selectedRowIndex.row
            destination.index2 = self.rowIndexPlayer
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