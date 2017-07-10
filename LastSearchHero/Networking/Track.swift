//
//  Track.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import Mapper


struct Track: Mappable {

    let name : String?
    let url : String?
    let duration : Int?
    let streamable : Streamable?
    let artist : Artist?

    init(map: Mapper) throws {

        name = map.optionalFrom("name")
        url = map.optionalFrom("url")
        duration = map.optionalFrom("duration")
        streamable = map.optionalFrom("streamable")
        artist = map.optionalFrom("artist")
    }


}
