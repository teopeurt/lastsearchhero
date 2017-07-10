//
//  Image.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import Mapper

private func transformURL(object: Any?) throws -> URL {
    guard let link = object as? String else {
        throw MapperError.convertibleError(value: object, type: String.self)
    }
    
    if let fileUrl = Foundation.URL(string: link){
        return fileUrl
    }
    
    throw MapperError.customError(field: nil, message: "Couldn't convert to URL!")
}


struct AlbumImage: Mappable {
    let urllink : URL?
    let size : String?

    init(map: Mapper) throws {
        urllink = map.optionalFrom("#text", transformation: transformURL)
        size = map.optionalFrom("size")
    }
    

}
