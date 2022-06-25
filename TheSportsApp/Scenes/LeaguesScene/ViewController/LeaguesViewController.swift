//
//  LeaguesViewController.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 20/06/2022.
//

import UIKit

class LeaguesViewController: UIViewController {
    //MARK: - Props
    var sportName :String?
    let leaguesViewModel = LeaguesViewModel()
    var league: SportsModel?
    @IBOutlet weak var leaguesTableView: UITableView!
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        leaguesTableView.delegate=self
        leaguesTableView.dataSource=self
        leaguesTableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: .main), forCellReuseIdentifier: "LeaguesTableViewCell")
        fetch()
    }
    //MARK: - Methods
    func fetch() {
        Task.init {
            if let leagues = await leaguesViewModel.fetchLeagues(sportName: sportName ?? "") {
                self.leaguesViewModel.leagues = leagues
                DispatchQueue.main.async {
                    self.leaguesTableView.reloadData()
                }
            } else {
                print("error")
            }
        }
    }
}
//MARK: - TableView
extension LeaguesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        leaguesTableView.deselectRow(at: indexPath, animated: true)
        let data = leaguesViewModel.leagues[indexPath.row]
        let vc = UIStoryboard(name: "LeagueDetailsStoryBoard", bundle: .main).instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        vc.modalPresentationStyle = .fullScreen
        vc.leagueDetails = data
        vc.leagueID = leaguesViewModel.leagues[indexPath.row].idLeague
        passedID = leaguesViewModel.leagues[indexPath.row].idLeague
        self.present(vc, animated: true)
    }
}
extension LeaguesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguesViewModel.leagues.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leaguesTableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath)   as! LeaguesTableViewCell
        cell.strLeague.text = leaguesViewModel.leagues[indexPath.row].strLeague
        cell.strBadge.downloaded(from: leaguesViewModel.leagues[indexPath.row].strBadge ?? "")
        cell.strBadge.layer.masksToBounds = true
        cell.strBadge.layer.cornerRadius =  cell.strBadge.frame.height/2
        cell.strBadge.clipsToBounds = true
        cell.cellDelegate = self
        cell.index = indexPath
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
extension LeaguesViewController: TableViewNew {
    func onClickCell(index: Int) {
        print("the index is: \(index)")
        if let youtubeURL = URL(string: "https://\(leaguesViewModel.leagues[index].strYoutube!)") {
            UIApplication.shared.open(youtubeURL)
            
        }
    }
}
