//
//  TeamDetailsViewController.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 23/06/2022.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    var teamDetails : TeamsModel?
    
    @IBAction func backToLeagueDetailsBtn(_ sender: UIButton) {
        dismiss(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
