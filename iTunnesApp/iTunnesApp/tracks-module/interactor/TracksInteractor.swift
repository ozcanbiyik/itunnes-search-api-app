//
//  TracksInteractor.swift
//  iTunnesApp
//
//  Created by Ozcan Biyik on 8.03.2022.
//

import Foundation
import Alamofire

class TracksInteractor: PresenterToInteractorTracksProtocol{
    var tracksPresenter: InteractorToPresenterTracksProtocol?
    
    func getAllTracks() {
        AF.request("https://itunes.apple.com/search?term=jack+johnson&limit=25",method: .get).response { response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(TracksResponse.self, from: data)
                    var list = [Tracks]()
                    if let cmgList = response.results{
                        list = cmgList;
                    }
                    self.tracksPresenter?.sendDataToPresenter(tracks: list)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func searchTrack(searchChar: String) {
        AF.request("https://itunes.apple.com/search?term=jack+johnson&limit=25", method: .get).response{ response in
            if let data = response.data{
                do{
                    let response = try JSONDecoder().decode(TracksResponse.self, from: data)
                    var list = [Tracks]()
                    if let cmgList = response.results{
                        list = cmgList.filter{$0.trackName!.localizedCaseInsensitiveContains(searchChar)}
                    }
                    self.tracksPresenter?.sendDataToPresenter(tracks: list)
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
