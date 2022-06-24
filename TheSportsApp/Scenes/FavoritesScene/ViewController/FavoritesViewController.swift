//
//  FavoritesViewController.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 22/06/2022.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let alert : UIAlertController = UIAlertController(title:"You Are Disconnected!" , message: "Please Connect to Network", preferredStyle: .alert)
    var favoritesModel = [Favorites]()
    @IBOutlet weak var favoritesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesTableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: .main), forCellReuseIdentifier: "LeaguesTableViewCell")
        fetchFavorites()
        netMonitorAlert()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchFavorites()
        
    }
    
    func fetchFavorites() {
        CoreDataManager.shared.fetch(Entity: Favorites.self) { (Favorites) in
            self.favoritesModel = Favorites
            DispatchQueue.main.async {
                self.favoritesTableView.reloadData()
            }
        }
    }
    
    func netMonitorAlert() {
        if NetworkMonitor.shared.isConnected  {
            print("you are connected")
            //loadingIndicator.isHidden = true
        } else {
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { alertAction in
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
extension FavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        favoritesTableView.deselectRow(at: indexPath, animated: true)
        
        let vc = UIStoryboard(name: "LeagueDetailsStoryBoard", bundle: .main).instantiateViewController(withIdentifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

extension FavoritesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoritesModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell
        
        cell.strLeague.text = favoritesModel[indexPath.row].leagueName
        cell.strBadge.downloaded(from: favoritesModel[indexPath.row].leagueBadge ?? "")
        cell.strBadge.layer.masksToBounds = true
        cell.strBadge.layer.cornerRadius =  cell.strBadge.frame.height/2
        cell.strBadge.clipsToBounds = true
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let item = favoritesModel[indexPath.row]
            
            CoreDataManager.shared.delete(Entity: Favorites.self, delete: item)
            CoreDataManager.shared.fetch(Entity: Favorites.self) { (item) in
                self.favoritesModel = item
                DispatchQueue.main.async {
                    self.favoritesTableView.reloadData()
                }
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let identifier = "\(String(describing: index))" as NSString
        return UIContextMenuConfiguration( identifier: identifier, previewProvider: nil) { [weak self]_ in
            let bookmarkAction = UIAction(title: "Bookmark", image: UIImage(systemName: "bookmark.fill")) { _ in
            }
            let safariAction = UIAction(
                title: "Open in Safari",
                image: UIImage(systemName: "link")) { _ in
                    self?.openInSafari(indexPath: indexPath)
                }
            let shareAction = UIAction(
                title: "Share",
                image: UIImage(systemName: "square.and.arrow.up")) { _ in
                    self?.shareUser(indexPath: indexPath)
                }
            let saveImage = UIAction(
                title: "Save Image",
                image: UIImage(systemName: "photo")) { _ in
                    self?.saveeImage(indexPath: indexPath)
                }
            return UIMenu(title: "", image: nil, children: [safariAction, bookmarkAction, saveImage, shareAction])
        }
    }
    //MARK:- LongPress Actions
    func openInSafari (indexPath: IndexPath) {
        
    }
    
    func shareUser (indexPath: IndexPath) {
        let usersURL = favoritesModel[indexPath.row].leagueName
        let sheetVC = UIActivityViewController(activityItems: [usersURL], applicationActivities: nil)
        self.present(sheetVC, animated: true)
    }
    func saveeImage (indexPath: IndexPath) {
        
    }
    
}

