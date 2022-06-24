//
//  LeagueDetailsTableViewCell.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 21/06/2022.
//

import UIKit

class LeagueDetailsTableViewCell: UITableViewCell {

    
    let leagueDetailsDelegate = LeagueDetailsViewController()
    let leagueDetailsViewModel = LeagueDetailsViewModel()
    @IBOutlet weak var leagueDetailsCollectionInTableViewCell: UICollectionView!
    var upcomingEvents = [UpcomingEventsModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leagueDetailsCollectionInTableViewCell.delegate=self
        leagueDetailsCollectionInTableViewCell.dataSource=self
        leagueDetailsCollectionInTableViewCell.register(UINib(nibName: "UpcomingEventsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "UpcomingEventsCollectionViewCell")
        fetch()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func fetch() {
        Task.init {
            if let upcomingEvents = await leagueDetailsViewModel.fetchUpcomingEvents()
            {
                self.upcomingEvents = upcomingEvents
                DispatchQueue.main.async {
                    self.leagueDetailsCollectionInTableViewCell.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
    
}

extension LeagueDetailsTableViewCell: UICollectionViewDelegate {
    
}

extension LeagueDetailsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomingEvents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = leagueDetailsCollectionInTableViewCell.dequeueReusableCell(withReuseIdentifier: "UpcomingEventsCollectionViewCell", for: indexPath) as!  UpcomingEventsCollectionViewCell
        
       // cell.strEvent.text="Champions League Final"
       //  cell.dateEvent.text="22/6/2022"
       // cell.timeEvent.text="20:00:00"
        
        cell.strEvent.text=upcomingEvents[indexPath.row].strEvent
        cell.dateEvent.text=upcomingEvents[indexPath.row].dateEvent
        cell.timeEvent.text=upcomingEvents[indexPath.row].strTime
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}

extension LeagueDetailsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let leftAndRightPaddings: CGFloat = 3
        let numberOfItemsPerRow: CGFloat = 2.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width) // You can change width and height here as pr your requirement
    
    }
}



