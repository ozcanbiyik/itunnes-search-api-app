//
//  DetailVC.swift
//  iTunnesApp
//
//  Created by Ozcan Biyik on 9.03.2022.
//

import UIKit

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
            artistNameLabel.text = t.artistName
            trackNameLabel.text = t.trackName
            trackPriceLabel.text = "\(t.trackPrice!)$"
            collectionNameLabel.text = t.collectionName
            wrapperTypeLabel.text = t.wrapperType
            
        }
        
        trackView.layer.cornerRadius = 50
        trackView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]

    }
    
}
