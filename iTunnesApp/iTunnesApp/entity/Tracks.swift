//
//  Tracks.swift
//  iTunnesApp
//
//  Created by Ozcan Biyik on 8.03.2022.
//

import Foundation

struct Tracks: Codable{
    var artistName: String?
    var collectionName: String?
    var artworkUrl100: String?
    var trackCount: Int?
    var releaseDate: String?
    var wrapperType: String?
    var trackName: String?
    var trackPrice: Double?
    
    init(){
        
    }
    
    init(artistName: String, collectionName: String, artworkUrl100: String, trackCount: Int, releaseDate: String, wrapperType: String, trackName: String, trackPrice: Double){
        self.artistName = artistName
        self.collectionName = collectionName
        self.artworkUrl100 = artworkUrl100
        self.trackCount = trackCount
        self.releaseDate = releaseDate
        self.wrapperType = wrapperType
        self.trackName = trackName
        self.trackPrice = trackPrice
    }
}
