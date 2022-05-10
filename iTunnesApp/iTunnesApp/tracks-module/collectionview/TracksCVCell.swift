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
    
    func setup(with tracks: Tracks){
        
        artistNameLabel.text = tracks.artistName
        categoryNameLabel.text = tracks.wrapperType
        trackNameLabel.text = tracks.trackName
        tracksImageName(tracksName: tracks.artworkUrl100 ?? "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/100x100bb.jpg")
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.1
        layer.cornerRadius = 10
        
    }
    
}
