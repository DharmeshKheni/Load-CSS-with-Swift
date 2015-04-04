//
//  TableViewController.swift
//  testing
//
//  Created by Anil on 04/04/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit
import MessageUI

class TableViewController: UITableViewController, MFMailComposeViewControllerDelegate {

    var tabledata = ["1","2","3","4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return tabledata.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = tabledata[indexPath.row]
        return cell
    }

    override func tableView(tableView: UITableView,editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        var ReportAction = UITableViewRowAction(style: .Default, title: "Report User", handler: {(action: UITableViewRowAction! , indexPath:NSIndexPath!) -> Void in
            
            let ReportMenu = UIAlertController(title: nil, message: "Report using", preferredStyle: UIAlertControllerStyle.ActionSheet)
            let Reportbutton = UIAlertAction(title: "E-Mail", style: UIAlertActionStyle.Default) { (alert) -> Void in
                
                self.displayMailComposerSheet()
            }
            ReportMenu.addAction(Reportbutton)
            self.presentViewController(ReportMenu, animated: true, completion: nil)
            
            
        })
        
        var DeleteButton = UITableViewRowAction(style: UITableViewRowActionStyle.Default , title: "Delete", handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            self.tabledata.removeAtIndex(indexPath.row)
            
            
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            }
        )
        return [DeleteButton , ReportAction]
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            
            // remove the deleted item from the model
            self.tabledata.removeAtIndex(indexPath.row)
            // remove the deleted item from the `UITableView`
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            return
        }
    }
    
    func displayMailComposerSheet(){
        
        //vars
        var controller = MFMailComposeViewController()
        controller.mailComposeDelegate = self
        
        //set
        controller.navigationBar.tintColor = UIColor.whiteColor()
        
        //set
        UINavigationBar.appearance().translucent = false
        UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
        UINavigationBar.appearance().tintColor = UIColor.blackColor()
        var attributes = NSDictionary(objectsAndKeys: UIFont(name: "HelveticaNeue-Light", size: 20)!,NSFontAttributeName, UIColor.whiteColor(), NSForegroundColorAttributeName)
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        //set
        var toRecipients = NSArray(object: "support@w24x.com")
        controller.setToRecipients(toRecipients)
        controller.setSubject("w24x App Support")
        
        //show
        presentViewController(controller, animated: true, completion: {
            
            UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: true)
        })
    }
}
