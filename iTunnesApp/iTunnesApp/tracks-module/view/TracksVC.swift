//
//  TracksVC.swift
//  iTunnesApp
//
//  Created by Ozcan Biyik on 8.03.2022.
//

import UIKit

class TracksVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var trsCollectionView: UICollectionView!
    
    var tracks = [Tracks]()
    var tracksPresenterObject: ViewToPresenterTracksProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //searchBar.delegate = self
        //trsCollectionView.delegate = self
        //trsCollectionView.dataSource = self
        
        TracksRouter.createModule(ref: self)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tracksPresenterObject?.getTracks()
    }


}
