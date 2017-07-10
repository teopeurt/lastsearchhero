//
//  AlbumSearchResults.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import Mapper

struct AlbumSearchResults: Mappable {

    let totalResults : Int?
    let startIndex : Int?
    let itemsPerPage : Int?
    let albummatches : AlbumMatches?

    init(map: Mapper) throws {
        totalResults = map.optionalFrom("opensearch:totalResults")
        startIndex = map.optionalFrom("startIndex")
        itemsPerPage = map.optionalFrom("opensearch:itemsPerPage")
        albummatches = map.optionalFrom("results.albummatches")
    }

}
