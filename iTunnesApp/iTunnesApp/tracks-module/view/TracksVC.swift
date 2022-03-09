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
        searchBar.delegate = self
        trsCollectionView.delegate = self
        trsCollectionView.dataSource = self
        
        TracksRouter.createModule(ref: self)
        tracksPresenterObject?.getTracks()
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 5
        design.minimumLineSpacing = 5
        
        let widht = self.trsCollectionView.frame.size.width
        design.itemSize = CGSize(width: (widht-25)/2, height: (widht-25)/2)
        
        trsCollectionView.collectionViewLayout = design
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tracksPresenterObject?.getTracks()
    }


}

extension TracksVC: PresenterToViewTracksProtocol{
    func sendDataToView(tracks: Array<Tracks>) {
        self.tracks = tracks
        DispatchQueue.main.async {
            self.trsCollectionView.reloadData()
        }
        
    }
}

extension TracksVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //tracksPresenterObject
    }
}

extension TracksVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tracks.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let track = tracks[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tracksCell", for: indexPath) as!TracksCVCell
        
        cell.artistNameLabel.text = track.artistName
        cell.categoryNameLabel.text = track.wrapperType
        cell.trackNameLabel.text = track.trackName
        cell.tracksImageName(tracksName: track.artworkUrl100 ?? "https://is1-ssl.mzstatic.com/image/thumb/Music115/v4/ae/4c/d4/ae4cd42a-80a9-d950-16f5-36f01a9e1881/source/100x100bb.jpg")
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 10
        
        //
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let _ = tracks[indexPath.row]
        //
    }
    
}


