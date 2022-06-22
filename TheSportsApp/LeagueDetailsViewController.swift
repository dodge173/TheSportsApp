//
//  LeagueDetailsViewController.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 21/06/2022.
//

import UIKit
import CoreData

class LeagueDetailsViewController: UIViewController {
    
    var leagueDetails: LeaguesModel?
    var leagueDetailsViewModel = LeagueDetailsViewModel()
    var upcomingevents = [Favorites]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBAction func BackBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBOutlet weak var favoriteBtn: UIButton!
    @IBOutlet weak var leagueDetailsTableView: UITableView!
    @IBOutlet weak var leaguename: UILabel!
    @IBAction func favoriteBtn(_ sender: UIButton) {
        
        if favoriteBtn.titleLabel?.text == " " {
            
            Favorites(context: self.context).leagueName = leagueDetails?.strLeague
            do {
                try self.context.save()
                favoriteBtn.setTitle("   ", for: .normal)
                favoriteBtn.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
            } catch {
                print("Error")
            }
            //
        } else {
            favoriteBtn.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }
    
    override func viewDidLoad() {
        
        leagueDetailsTableView.delegate=self
        leagueDetailsTableView.dataSource=self
        leagueDetailsTableView.register(UINib(nibName: "LeagueDetailsTableViewCell", bundle: .main), forCellReuseIdentifier: "LeagueDetailsTableViewCell")
        leagueDetailsTableView.register(UINib(nibName: "LatestResultsTableViewCell", bundle: .main), forCellReuseIdentifier: "LatestResultsTableViewCell")
        leagueDetailsTableView.register(UINib(nibName: "TeamsTableViewCell", bundle: .main), forCellReuseIdentifier: "TeamsTableViewCell")
        leaguename.text = leagueDetails?.strLeague
    }
}

extension LeagueDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        leagueDetailsTableView.deselectRow(at: indexPath, animated: true)
    }
}

extension LeagueDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0  {
            let cell = leagueDetailsTableView.dequeueReusableCell(withIdentifier: "LeagueDetailsTableViewCell", for: indexPath)   as! LeagueDetailsTableViewCell
            return cell
        }
        if indexPath.row == 1 {
            let cell = leagueDetailsTableView.dequeueReusableCell(withIdentifier: "LatestResultsTableViewCell", for: indexPath)   as! LatestResultsTableViewCell
            return cell
        }
        let cell = leagueDetailsTableView.dequeueReusableCell(withIdentifier: "TeamsTableViewCell", for: indexPath)  as!    TeamsTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}
