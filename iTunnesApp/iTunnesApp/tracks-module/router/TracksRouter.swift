//
//  TracksRouter.swift
//  iTunnesApp
//
//  Created by Ozcan Biyik on 8.03.2022.
//

import Foundation

class TracksRouter: PresenterToRouterTracksProtocol{
    static func createModule(ref: TracksVC) {
        
        let presenter = TracksPresenter()
        ref.tracksPresenterObject = presenter
        ref.tracksPresenterObject?.tracksInteractor = TracksInteractor()
        ref.tracksPresenterObject?.tracksView = ref
        ref.tracksPresenterObject?.tracksInteractor?.tracksPresenter = presenter

    }
    
}
