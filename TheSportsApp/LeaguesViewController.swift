//
//  LeaguesViewController.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 20/06/2022.
//

import UIKit

class LeaguesViewController: UIViewController {

    var leagues = [LeaguesModel]()
    let leaguesViewModel = LeaguesViewModel()
    var league: SportsModel?
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
            if let leagues = await leaguesViewModel.fetch() {
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
        
    }
}

extension LeaguesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leaguesTableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath)   as! LeaguesTableViewCell
        cell.strLeague.text = leagues[indexPath.row].strLeague
        cell.strSport.text = leagues[indexPath.row].strSport
        cell.backgroundColor = .lightGray
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
