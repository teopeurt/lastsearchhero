//
//  AlbumTableViewModel.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import RxSwift

final class AlbumTableViewModel: AlbumTableViewModelType{
    
    let name: Observable<String>
    let artist: Observable<String>
    
    init(album: Album){
        name = .just(album.name ?? "no-name ")
        artist = .just(album.artist ?? "no-artist")
    }
}
