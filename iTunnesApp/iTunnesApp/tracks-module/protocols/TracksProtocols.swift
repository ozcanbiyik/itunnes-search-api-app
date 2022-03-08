//
//  TracksProtocols.swift
//  iTunnesApp
//
//  Created by Ozcan Biyik on 8.03.2022.
//

import Foundation

protocol PresenterToInteractorTracksProtocol{
    var tracksPresenter: InteractorToPresenterTracksProtocol?{get set}
    func getAllTracks()
}

protocol ViewToPresenterTracksProtocol{
    var tracksInteractor: PresenterToInteractorTracksProtocol?{get set}
    var tracksView: PresenterToViewTracksProtocol?{get set}
    func getTracks()
    
}

protocol InteractorToPresenterTracksProtocol{
    func sendDataToPresenter(tracks: Array<Tracks>)
}

protocol PresenterToViewTracksProtocol{
    func sendDataToView(tracks: Array<Tracks>)
}

protocol PresenterToRouterTracksProtocol{
    static func createModule(ref: TracksVC)
}
