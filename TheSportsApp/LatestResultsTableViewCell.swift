//
//  LatestResultsTableViewCell.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 21/06/2022.
//

import UIKit

class LatestResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var latestResultsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        latestResultsCollectionView.delegate=self
        latestResultsCollectionView.dataSource=self
        latestResultsCollectionView.register(UINib(nibName: "LatestResultsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "LatestResultsCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension LatestResultsTableViewCell: UICollectionViewDelegate {
    
}

extension LatestResultsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = latestResultsCollectionView.dequeueReusableCell(withReuseIdentifier: "LatestResultsCollectionViewCell", for: indexPath) as!  LatestResultsCollectionViewCell
        
        cell.firstTeamVsSecondTeamLAbel.text="RealMadrid vs Barcelona"
        cell.timeLabel.text="23:41"
        cell.dateLabel.text="22/6/2022"
        cell.firstScoreVsSecondScore.text="10 - 0"
        
        return cell
    }
    
    
}
