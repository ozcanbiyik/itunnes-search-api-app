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
        
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumInteritemSpacing = 5
        design.minimumLineSpacing = 5
        let widht = self.trsCollectionView.frame.size.width
        design.itemSize = CGSize(width: (widht-25)/2, height: (widht-25)/2)
        trsCollectionView.collectionViewLayout = design
        
        TracksRouter.createModule(ref: self)
        tracksPresenterObject?.getTracks()
        
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
        if searchText == ""{
            tracksPresenterObject?.getTracks()
        }else{
            tracksPresenterObject?.search(searchChar: searchText)
        }
    }
}

extension TracksVC: UICollectionViewDelegate, UICollectionViewDataSource{
    
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tracks.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tracksCell", for: indexPath) as!TracksCVCell
        cell.setup(with: tracks[indexPath.row])
        return cell
        
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let track = tracks[indexPath.row]
        collectionView.deselectItem(at: indexPath, animated: true)
        performSegue(withIdentifier: "toDetail", sender: track)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            let track = sender as? Tracks
            let goToVC = segue.destination as! DetailVC
            goToVC.track = track
        }
    }
    
}

