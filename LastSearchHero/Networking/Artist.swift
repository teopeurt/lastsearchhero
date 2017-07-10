//
// Created by d onwunumah on 09/07/2017.
// Copyright (c) 2017 d onwunumah. All rights reserved.
//

import Mapper

struct Artist: Mappable {

    let name : String?
    let mbid : String?
    let url : String?

    init(map: Mapper) throws {
        name  = map.optionalFrom("name")
        mbid  = map.optionalFrom("mbid")
        url  = map.optionalFrom("url")
    }


}
