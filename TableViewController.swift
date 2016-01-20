//
//  TableViewController.swift
//  ExpandableTest
//
//  Created by Dominic Vitucci on 1/18/16.
//  Copyright © 2016 Dominic Vitucci. All rights reserved.
//

import UIKit

let cellID = "cell"
class TableViewController: UITableViewController {
    
    var testArray = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testArray = ["Intrauterine Device","Intrauterine Device","Intrauterine Device", "Intrauterine Device", "Intrauterine Device"]
    
    
    }

    var selectedIndexPath : NSIndexPath?
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! TableViewCell
        let row = indexPath.row
        cell.titleLabel.text = testArray[row] as? String
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let previousIndexPath = selectedIndexPath
        if indexPath == selectedIndexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }
        
        var indexPaths : Array<NSIndexPath> = []
        if let previous = previousIndexPath {
            indexPaths += [previous]
        }
        if let current = selectedIndexPath {
            indexPaths += [current]
        }
        if indexPaths.count > 0 {
            tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! TableViewCell).watchFrameChanges()
        
//        cell.contentView.backgroundColor=UIColor.clearColor()
//        
//        var whiteRoundedCornerView:UIView!
//        whiteRoundedCornerView=UIView(frame: CGRectMake(5,10,self.view.bounds.width-10,120))
//        whiteRoundedCornerView.backgroundColor=UIColor(red: 158/255.0, green: 112/255.0, blue: 65/255.0, alpha: 1.0)
//        whiteRoundedCornerView.layer.masksToBounds=false
//        
//        whiteRoundedCornerView.layer.shadowOpacity = 1.55;
//        
//        
//        
//        whiteRoundedCornerView.layer.shadowOffset = CGSizeMake(1, 0);
//        whiteRoundedCornerView.layer.shadowColor=UIColor(red: 53/255.0, green: 143/255.0, blue: 185/255.0, alpha: 1.0).CGColor
//        
//        
//        
//        whiteRoundedCornerView.layer.cornerRadius=3.0
//        whiteRoundedCornerView.layer.shadowOffset=CGSizeMake(-1, -1)
//        whiteRoundedCornerView.layer.shadowOpacity=0.5
//        cell.contentView.addSubview(whiteRoundedCornerView)
//        cell.contentView.sendSubviewToBack(whiteRoundedCornerView)
        

    }
    
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        (cell as! TableViewCell).ignoreFrameChanges()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        for cell in tableView.visibleCells as! [TableViewCell] {
            cell.ignoreFrameChanges()
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            return TableViewCell.expandedHeight
        } else {
            return TableViewCell.defaultHeight
        }
    }
}
