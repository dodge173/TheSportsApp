//
//  SportsViewController.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 19/06/2022.
//

import UIKit

class SportsViewController: UIViewController {
    // MARK: - Props
    let sportsViewModel = SportsViewModel()
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        sportsCollectionView.delegate = self
        sportsCollectionView.dataSource = self
        sportsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        sportsCollectionView.register(UINib(nibName: "SportsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "SportsCollectionViewCell")
        fetch()
    }
    // MARK: - Methods
    func fetch() {
        Task.init {
            if let sports = await sportsViewModel.fetchSports() {
                sportsViewModel.sports = sports
                DispatchQueue.main.async {
                    self.sportsCollectionView.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
}
// MARK: - CollectionView
extension SportsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sport = sportsViewModel.sports[indexPath.row]
        let vc = UIStoryboard(name: "LeaguesStoryboard", bundle: .main).instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
        vc.league = sport
        vc.sportName = sportsViewModel.sports[indexPath.row].strSport
        collectionView.deselectItem(at: indexPath, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension SportsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsViewModel.sports.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sportsCollectionView.dequeueReusableCell(withReuseIdentifier: "SportsCollectionViewCell", for: indexPath)   as! SportsCollectionViewCell
        cell.strSport.text = sportsViewModel.sports[indexPath.row].strSport
        cell.strSportThumb.downloaded(from: sportsViewModel.sports[indexPath.row].strSportThumb)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
extension SportsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let leftAndRightPaddings: CGFloat = 1
        let numberOfItemsPerRow: CGFloat = 2.0
        
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width) // You can change width and height here as pr your requirement
        
    }
}
