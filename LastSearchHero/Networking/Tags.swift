//
// Created by d onwunumah on 09/07/2017.
// Copyright (c) 2017 d onwunumah. All rights reserved.
//

import Mapper

struct Tags: Mappable{
    let tag : Array<Tag>?
    
    init(map: Mapper) throws {
        
        tag = map.optionalFrom("tag")
        
    }
}
