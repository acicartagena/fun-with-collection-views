//
//  CollectionViewCell.swift
//  CollectionViewInTableViewCell
//
//  Created by Angela Cartagena on 7/06/2016.
//  Copyright © 2016 Airtasker. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell {

    @IBOutlet weak var colorView: UIView!
    static let reuseIdentifier: String = "ColorCell"
    func setupCell() {
        contentView.setNeedsLayout()
        colorView.backgroundColor =  UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
}
