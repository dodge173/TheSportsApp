//
//  SportsCollectionViewCell.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 19/06/2022.
//

import UIKit

class SportsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var strSportThumb: UIImageView!
    @IBOutlet weak var sportsView: UIView!
    @IBOutlet weak var strSport: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sportsView.layer.cornerRadius = 20
        strSportThumb.layer.masksToBounds = true
        strSportThumb.layer.cornerRadius =  strSportThumb.frame.height/2
        strSportThumb.clipsToBounds = true
    }
    
}
