//
//  TeamsCollectionViewCell.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 21/06/2022.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        teamImage.addGestureRecognizer(tap)
        
        teamImage.isUserInteractionEnabled = true
        
    }

    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        GlobalNotificationCenter().nc.post(name: Notification.Name("present"), object: nil)
    }
}

class GlobalNotificationCenter {
    let nc = NotificationCenter.default
}
