//
//  TeamsTableViewCell.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 21/06/2022.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {

    @IBOutlet weak var teamsCollectionView: UICollectionView!
    let leagueDetailsViewModel = LeagueDetailsViewModel()
    var teams = [TeamsModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        teamsCollectionView.delegate=self
        teamsCollectionView.dataSource=self
        teamsCollectionView.register(UINib(nibName: "TeamsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "TeamsCollectionViewCell")
        fetch()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fetch() {
        Task.init {
            if let teams = await leagueDetailsViewModel.fetchTeams() {
                self.teams = teams
                DispatchQueue.main.async {
                    self.teamsCollectionView.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
}

extension TeamsTableViewCell: UICollectionViewDelegate {
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        

   }
    
}

extension TeamsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(teams.count)
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "TeamsCollectionViewCell", for: indexPath) as!  TeamsCollectionViewCell
        
      //  cell.teamImage.image=
        cell.teamNameLabel.text=teams[indexPath.row].strTeam
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
}

extension TeamsTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let leftAndRightPaddings: CGFloat = 3
        let numberOfItemsPerRow: CGFloat = 2.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width) // You can change width and height here as pr your requirement
    
    }
}


