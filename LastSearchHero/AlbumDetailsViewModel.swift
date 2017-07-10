//
//  AlbumDetailsViewModel.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import Foundation
import RxSwift

struct AlbumDetailsViewModel {
    
    let albumName = BehaviorSubject<String?>(value: "")
    let artist = BehaviorSubject<String?>(value: "")
    var imageUrl: URL?
    
    let placeholder = UIImage(named: "white")
    
    
    init(album: Album) {
        
        albumName.onNext(album.name)
        artist.onNext(album.artist)
        
        if album.image != nil {
         
            for image in album.image!{
                
                if (image.size == "extralarge")
                {
                    imageUrl = image.urllink
                }
            }
            
        }
        
    }
    
}
