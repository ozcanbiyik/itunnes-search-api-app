//
//  TracksCVCell.swift
//  iTunnesApp
//
//  Created by Ozcan Biyik on 8.03.2022.
//

import UIKit
import Kingfisher


class TracksCVCell: UICollectionViewCell {
    
    @IBOutlet weak var tracksImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    func tracksImageName(tracksName:String){
        if let url = URL(string: "\(tracksName)"){
            DispatchQueue.main.async {
                self.tracksImage.kf.setImage(with:url)
            }
        }
    }
    
}
