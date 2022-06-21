//
//  LeagueDetailsTableViewCell.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 21/06/2022.
//

import UIKit

class LeagueDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueDetailsCollectionInTableViewCell: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        leagueDetailsCollectionInTableViewCell.delegate=self
        leagueDetailsCollectionInTableViewCell.dataSource=self
        leagueDetailsCollectionInTableViewCell.register(UINib(nibName: "UpcomingEventsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "UpcomingEventsCollectionViewCell")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension LeagueDetailsTableViewCell: UICollectionViewDelegate {
    
}

extension LeagueDetailsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = leagueDetailsCollectionInTableViewCell.dequeueReusableCell(withReuseIdentifier: "UpcomingEventsCollectionViewCell", for: indexPath) as!  UpcomingEventsCollectionViewCell
        
        cell.strEvent.text="ChampiosLeagueFinal"
        cell.dateEvent.text="12th of September/2022"
        cell.timeEvent.text="07:51 pm"
       
        return cell
    }
    
}


