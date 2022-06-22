//
//  LatestResultsCollectionViewCell.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 21/06/2022.
//

import UIKit

class LatestResultsCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var secondTeamLabel: UILabel!
    @IBOutlet weak var firstTeamScore: UILabel!
    @IBOutlet weak var secondTeamScore: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
