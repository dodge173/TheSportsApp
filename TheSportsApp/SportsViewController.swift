//
//  SportsViewController.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 19/06/2022.
//

import UIKit

class SportsViewController: UIViewController {
    
    @IBOutlet weak var sportsCollectionView: UICollectionView!
    
    var array = ["Football","Tennis","Basketball","VolleyBall","Golf","Cricket"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sportsCollectionView.delegate=self
        sportsCollectionView.dataSource=self
        sportsCollectionView.register(UINib(nibName: "SportsCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "SportsCollectionViewCell")
        // Do any additional setup after loading the view.
        fetchSports()
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

func fetchSports() {
    Task.init {
        if let sports = try? await NetworkManager.shared.fetchSports(endPoint: "api/v1/json/2/all_sports.php", SportsAppModel: Sports.self) {
            print(sports)
        } else {
            print("error")
        }
    }
}



extension SportsViewController: UICollectionViewDelegate {
    
}

extension SportsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(array.count)
        return array.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = sportsCollectionView.dequeueReusableCell(withReuseIdentifier: "SportsCollectionViewCell", for: indexPath)   as! SportsCollectionViewCell
        cell.strSport.text=array[indexPath.row]
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    
}

extension SportsViewController: UICollectionViewDelegateFlowLayout {
    
 

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let leftAndRightPaddings: CGFloat = 5
        let numberOfItemsPerRow: CGFloat = 2.0
    
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width) // You can change width and height here as pr your requirement
    
    }
}
