//
//  article.swift
//  iOSExercise
//
//  Created by Mac on ١٥ صفر، ١٤٤٠ هـ.
//  Copyright © ١٤٤٠ هـ Mac. All rights reserved.
//

import UIKit

class articleCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
