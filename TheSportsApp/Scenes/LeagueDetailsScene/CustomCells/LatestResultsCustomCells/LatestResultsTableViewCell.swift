//
//  LatestResultsTableViewCell.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 21/06/2022.
//

import UIKit

class LatestResultsTableViewCell: UITableViewCell {

    var leagueDetailsDelegate = LeagueDetailsViewController()
    let leagueDetailsViewModel = LeagueDetailsViewModel()
    @IBOutlet weak var latestResultsCollectionView: UICollectionView!
    var latestResults = [LatestResultsModel]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        latestResultsCollectionView.delegate=self
        latestResultsCollectionView.dataSource=self
        latestResultsCollectionView.register(UINib(nibName: "LatestResultsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "LatestResultsCollectionViewCell")
        fetch()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fetch() {
        Task.init {
            if let latestResults = await leagueDetailsViewModel.fetchLatestResults(leagueID: passedID ?? "") {
                self.latestResults = latestResults
                DispatchQueue.main.async {
                    self.latestResultsCollectionView.reloadData()
                }
            } else {
                print("error")
            }
        }
    }

}

extension LatestResultsTableViewCell: UICollectionViewDelegate {
    
}

extension LatestResultsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return latestResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = latestResultsCollectionView.dequeueReusableCell(withReuseIdentifier: "LatestResultsCollectionViewCell", for: indexPath) as!  LatestResultsCollectionViewCell
        
        cell.dateLabel.text=latestResults[indexPath.row].dateEvent
        cell.timeLabel.text=latestResults[indexPath.row].strTime
        cell.firstTeamScore.text=latestResults[indexPath.row].intHomeScore
        cell.secondTeamScore.text=latestResults[indexPath.row].intAwayScore
        cell.homeTeamLabel.text=latestResults[indexPath.row].strHomeTeam
        cell.secondTeamLabel.text=latestResults[indexPath.row].strAwayTeam
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

extension LatestResultsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let leftAndRightPaddings: CGFloat = 3
        let numberOfItemsPerRow: CGFloat = 2.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: 150) // You can change width and height here as pr your requirement
    
    }
}
