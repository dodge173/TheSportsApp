//
//  LeagueDetailsViewController.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 21/06/2022.
//

import UIKit

class LeagueDetailsViewController: UIViewController {
    
    @IBAction func backBtn(_ sender: UIButton) {
        dismiss(animated: true)
    }
    var leagueDetails: LeaguesModel?
    @IBOutlet weak var leagueDetailsTableView: UITableView!
    
    override func viewDidLoad() {
        
        leagueDetailsTableView.delegate=self
        leagueDetailsTableView.dataSource=self
        leagueDetailsTableView.register(UINib(nibName: "LeagueDetailsTableViewCell", bundle: .main), forCellReuseIdentifier: "LeagueDetailsTableViewCell")
    }
}

extension LeagueDetailsViewController: UITableViewDelegate {
    
}

extension LeagueDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leagueDetailsTableView.dequeueReusableCell(withIdentifier: "LeagueDetailsTableViewCell", for: indexPath)   as! LeagueDetailsTableViewCell
        
        
        
        
        return cell
    }
    
    
}
