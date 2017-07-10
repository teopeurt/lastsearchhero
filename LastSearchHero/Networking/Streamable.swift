//
// Created by d onwunumah on 09/07/2017.
// Copyright (c) 2017 d onwunumah. All rights reserved.
//

import Mapper

struct Streamable: Mappable {

    let text : Int?
    let fulltrack : Int?

    init(map: Mapper) throws {

        text = map.optionalFrom("#text")
        fulltrack = map.optionalFrom("fulltrack")
    }

}
