//
//  AlbumMatches.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import Mapper

struct AlbumMatches: Mappable {

    let album : Array<Album>?

    init(map: Mapper) throws {
        album  = map.optionalFrom("album")
    }

}
