//
//  SportsViewController.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 19/06/2022.
//

import UIKit

class SportsViewController: UIViewController {
    
    var sports = [SportsModel]()
    let sportsViewModel = SportsViewModel()
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sportsCollectionView.delegate=self
        sportsCollectionView.dataSource=self
        sportsCollectionView.register(UINib(nibName: "SportsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "SportsCollectionViewCell")
        // Do any additional setup after loading the view.
        fetch()
    
    }
    
    func fetch() {
        Task.init {
            if let sports = await sportsViewModel.fetch() {
                self.sports = sports
                DispatchQueue.main.async {
                    self.sportsCollectionView.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
  }

extension SportsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let sports = sports[indexPath.row]
        let vc = UIStoryboard(name: "LeaguesStoryboard", bundle: .main).instantiateViewController(withIdentifier: "LeaguesViewController") as! LeaguesViewController
        vc.league = sports
        collectionView.deselectItem(at: indexPath, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension SportsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = sportsCollectionView.dequeueReusableCell(withReuseIdentifier: "SportsCollectionViewCell", for: indexPath)   as! SportsCollectionViewCell
        cell.strSport.text = sports[indexPath.row].strSport
        cell.strSportThumb.downloaded(from: sports[indexPath.row].strSportThumb)
        cell.backgroundColor = .lightGray
        cell.strSportThumb.layer.borderWidth = 0.125
                cell.strSportThumb.layer.masksToBounds = false
                cell.strSportThumb.layer.borderColor = UIColor.black.cgColor
                cell.strSportThumb.layer.cornerRadius = cell.strSportThumb.frame.height/2
                cell.strSportThumb.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
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
