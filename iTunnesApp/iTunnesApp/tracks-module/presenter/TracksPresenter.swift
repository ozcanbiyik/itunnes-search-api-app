//
//  TracksPresenter.swift
//  iTunnesApp
//
//  Created by Ozcan Biyik on 8.03.2022.
//

import Foundation

class TracksPresenter: ViewToPresenterTracksProtocol{
    var tracksInteractor: PresenterToInteractorTracksProtocol?
    
    var tracksView: PresenterToViewTracksProtocol?
    
    func getTracks() {
        tracksInteractor?.getAllTracks()
    }
    
    func search(searchChar: String) {
        tracksInteractor?.searchTrack(searchChar: searchChar)
    }
    
    
}

extension TracksPresenter: InteractorToPresenterTracksProtocol{
    func sendDataToPresenter(tracks: Array<Tracks>) {
        tracksView?.sendDataToView(tracks: tracks)
    }
    
}
