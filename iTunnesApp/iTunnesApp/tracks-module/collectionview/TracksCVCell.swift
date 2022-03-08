//
//  TracksCVCell.swift
//  iTunnesApp
//
//  Created by Ozcan Biyik on 8.03.2022.
//

import UIKit

class TracksCVCell: UICollectionViewCell {
    
    @IBOutlet weak var tracksImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    
    @IBAction func inspectButtonClicked(_ sender: Any) {
    }
    
}
