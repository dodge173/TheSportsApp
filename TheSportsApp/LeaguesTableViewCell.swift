//
//  LeaguesTableViewCell.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 20/06/2022.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var strLeague: UILabel!
    @IBOutlet weak var strSport: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
