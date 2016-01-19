//
//  TableViewController.swift
//  ExpandableTest
//
//  Created by Dominic Vitucci on 1/18/16.
//  Copyright © 2016 Dominic Vitucci. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var testArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testArray = ["1","2","3"]

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return testArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

         //Configure the cell...

        return cell
    }


    var thereIsCellTapped = false
    var selectedRowIndex = -1
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == selectedRowIndex && thereIsCellTapped {
            return 140
        }
        
        return 44
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.tableView.cellForRowAtIndexPath(indexPath)?.backgroundColor = UIColor.grayColor()
        
        // avoid paint the cell is the index is outside the bounds
        if self.selectedRowIndex != -1 {
            self.tableView.cellForRowAtIndexPath(NSIndexPath(forRow: self.selectedRowIndex, inSection: 0))?.backgroundColor = UIColor.whiteColor()
        }
        
        if selectedRowIndex != indexPath.row {
            self.thereIsCellTapped = true
            self.selectedRowIndex = indexPath.row
        }
        else {
            // there is no cell selected anymore
            self.thereIsCellTapped = false
            self.selectedRowIndex = -1
        }
        
        self.tableView.beginUpdates()
        self.tableView.endUpdates()
    }
}
