//
//  TeamsTableViewCell.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 21/06/2022.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {

    @IBOutlet weak var teamsCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        teamsCollectionView.delegate=self
        teamsCollectionView.dataSource=self
        teamsCollectionView.register(UINib(nibName: "TeamsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "TeamsCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TeamsTableViewCell: UICollectionViewDelegate {
    
}

extension TeamsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as!  TeamsCollectionViewCell
        
      //  cell.teamImage.image=
        cell.teamNameLabel.text="MAnchester United"
        cell.backgroundColor = .brown
        
        return cell
    }
    
    
}
