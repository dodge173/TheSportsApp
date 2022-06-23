//
//  LeaguesViewController.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 20/06/2022.
//

import UIKit

class LeaguesViewController: UIViewController {

    var leagueNames :String?
    var leagues = [LeaguesModel]()
    let leaguesViewModel = LeaguesViewModel()
    var league: SportsModel?
    var leagueArray = [LeaguesModel]()
    
    
    @IBOutlet weak var leaguesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesTableView.delegate=self
        leaguesTableView.dataSource=self
        leaguesTableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: .main), forCellReuseIdentifier: "LeaguesTableViewCell")
        // Do any additional setup after loading the view.
        fetch()
    }
    
    func fetch() {
        Task.init {
            if let leagues = await leaguesViewModel.fetchLeagues() {
                self.leagues = leagues
                DispatchQueue.main.async {
                    self.leaguesTableView.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
}

extension LeaguesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        leaguesTableView.deselectRow(at: indexPath, animated: true)
        
        let data = leagueArray[indexPath.row]
        let vc = UIStoryboard(name: "LeagueDetailsStoryBoard", bundle: .main).instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.leagueDetails = data
        self.present(vc, animated: true)
        
    }
}

extension LeaguesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leaguesTableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath)   as! LeaguesTableViewCell
        cell.strLeague.text = leagueArray[indexPath.row].strLeague
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func viewDidAppear(_ animated: Bool) {
        for item in leagues {
            if item.strSport == leagueNames {
                leagueArray.append(item)
                leaguesTableView.reloadData()
            }
        }
       
    }
  
}
