//
//  ViewController.swift
//  CollectionViewInTableViewCell
//
//  Created by Angela Cartagena on 7/06/2016.
//  Copyright © 2016 Airtasker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let textArray = ["hello hello hello you can never \n say never while we don't know it in time \n hello hello hello you can never \n say never while we don't know it in time", "There was a time when men were kind \nWhen their voices were soft \n And their words inviting \n There was a time when love was blind \n And the world was a song \n And the song was exciting \n There was a time \nThen it all went wrong", "where do we go from here, how do we carry on, i can't get beyond the questions", "I dreamed a dream in time gone by \n When hope was high \nAnd life worth living \nI dreamed that love would never die \nI dreamed that God would be forgiving", "don't go breaking my heart, i couldn't even if i tried, o honey if i get restless, baby you're not the type","say geronimo, say geronimo, say geronimo say geronimo \n can you feeeeeel my love, bombs away \n bombs away, can you feeeeeeeeeeeeeeeeel my love", "collection_view_cell", "welcome to the real world \n she said to me condescendingly", "they try to make me go to rehab \nand I say\n no no no", "and i would walk a thousand miles and i miss you and now i wonder. if i could fall into the sky do you think time could would pass me by, you know i'd walk a thousand miles if i could just see you tonight"]

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.estimatedRowHeight = 100
            tableView.tableFooterView = UIView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        guard indexPath.row != textArray.indexOf("collection_view_cell")! else { return 275 }
        return UITableViewAutomaticDimension
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        guard indexPath.row != textArray.indexOf("collection_view_cell")! else {
            let cell = tableView.dequeueReusableCellWithIdentifier(CollectionViewCell.reusableIdentifier) as! CollectionViewCell
            cell.setupCell()
            return cell
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(LabelCell.reuseIdentifier) as! LabelCell
        cell.label.text = textArray[indexPath.row]
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(ColorCell.reuseIdentifier, forIndexPath: indexPath) as! ColorCell
        cell.setupCell()
        return cell
    }
}



