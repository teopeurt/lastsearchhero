//
//  Tag.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import Mapper

struct Tag: Mappable {

    let name : String?
    let url : String?

    init(map: Mapper) throws {

        name = map.optionalFrom("name")
        url = map.optionalFrom("url")

    }

}
