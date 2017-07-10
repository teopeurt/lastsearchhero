//
// Created by d onwunumah on 09/07/2017.
// Copyright (c) 2017 d onwunumah. All rights reserved.
//

import Mapper

struct Tracks: Mappable {

    let track : Array<Track>?

    init(map: Mapper) throws {

        track = map.optionalFrom("track")

    }

}
