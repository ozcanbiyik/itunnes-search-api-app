//
//  DetailVC.swift
//  iTunnesApp
//
//  Created by Ozcan Biyik on 9.03.2022.
//

import UIKit
import Kingfisher

class DetailVC: UIViewController {

    @IBOutlet weak var trackImage: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var trackPriceLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var primaryGenreName: UILabel!
    @IBOutlet weak var wrapperTypeLabel: UILabel!
    @IBOutlet weak var trackView: UIView!
    
    var track: Tracks?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let t = track{
            
            trackImageName(trackImage: t.artworkUrl100 ?? "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/100x100bb.jpg")
            artistNameLabel.text = t.artistName
            trackNameLabel.text = t.trackName
            trackPriceLabel.text = "\(t.trackPrice ?? 0)$"
            collectionNameLabel.text = t.collectionName
            wrapperTypeLabel.text = t.wrapperType
            
        }
        
        trackView.layer.cornerRadius = 50
        trackView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]

    }
    
    func trackImageName(trackImage: String){
        if let url = URL(string: "\(trackImage)"){
            DispatchQueue.main.async {
                self.trackImage.kf.setImage(with:url)
            }
        }
    }
}

