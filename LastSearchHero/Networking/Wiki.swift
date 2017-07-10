//
// Created by d onwunumah on 09/07/2017.
// Copyright (c) 2017 d onwunumah. All rights reserved.
//

import Mapper

struct Wiki: Mappable {

    let published : String?
    let summary : String?
    let content : String?
    
    init(map: Mapper) throws {
        
         published = map.optionalFrom("published")
         summary = map.optionalFrom("summary")
         content = map.optionalFrom("content")
        
    }

}
