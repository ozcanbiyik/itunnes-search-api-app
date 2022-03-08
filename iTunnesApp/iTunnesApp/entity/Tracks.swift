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
    
    init(){
        
    }
    
    init(artistName: String, collectionName: String, artworkUrl100: String, trackCount: Int, releaseDate: String){
        self.artistName = artistName
        self.collectionName = collectionName
        self.artworkUrl100 = artworkUrl100
        self.trackCount = trackCount
        self.releaseDate = releaseDate
    }
}
