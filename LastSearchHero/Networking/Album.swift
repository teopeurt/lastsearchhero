//
//  Album.swift
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


struct Album: Mappable {

    let name : String?
    let artist : String?
    let url : URL?
    let image : Array<AlbumImage>?
    let streamable : Int?
    let mbid : String?
    
    
    let tracks : Tracks?
    let listeners : Int?
    let playcount : Int?
    let tags : Tags?
    let wiki : Wiki?



    init(map: Mapper) throws {

        name  = map.optionalFrom("name")
        artist  = map.optionalFrom("artist")
        url  = map.optionalFrom("url", transformation: transformURL)
        image  = map.optionalFrom("image")
        streamable  = map.optionalFrom("streamable")
        mbid  = map.optionalFrom("mbid")

        tracks  = map.optionalFrom("tracks")
        listeners  = map.optionalFrom("listeners")
        playcount  = map.optionalFrom("playcount")
        tags  = map.optionalFrom("tags")
        wiki  = map.optionalFrom("wiki")
        
        
    }

}
