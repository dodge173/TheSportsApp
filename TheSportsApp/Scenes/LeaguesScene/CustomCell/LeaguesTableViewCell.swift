//
//  LeaguesTableViewCell.swift
//  TheSportsApp
//
//  Created by Ahmad Ashraf on 20/06/2022.
//

import UIKit

protocol TableViewNew {
    func onClickCell(index: Int)
}
class LeaguesTableViewCell: UITableViewCell {

    var cellDelegate: TableViewNew?
    var index: IndexPath?
    
    @IBOutlet weak var strLeague: UILabel!

    @IBOutlet weak var strBadge: UIImageView!
    
    @IBAction func strYoutubeBtn(_ sender: UIButton) {
        cellDelegate?.onClickCell(index: (index?.row)!)
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
