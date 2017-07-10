//
//  LastFmService.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import Moya

private extension String {
    var URLEscapedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }
}

enum LastFmService {
    case albumInfo(album: String, artist: String)
    case albumSearch(album: String)

}

extension LastFmService: TargetType{
    
    var baseURL: URL { return URL(string: "http://ws.audioscrobbler.com")!}
    public static func ==(lhs: LastFmService, rhs: LastFmService) -> Bool {
        return false
    }
    var path: String {
        switch self {
        case .albumInfo(_, _ ), .albumSearch(_):
            return "/2.0/"
        }
    }
    var method: Moya.Method {
        return .get
    }
    var parameters: [String: Any]? {
        switch self {

        case .albumInfo(let album, let artist ):
                return ["method":"album.getinfo", "api_key":"323f4d0932ef2caf74261a6a211497e3", "format":"json",
                        "album":album.URLEscapedString,  "artist":artist.URLEscapedString]
        case .albumSearch(let album):
            return ["method":"album.search", "api_key":"323f4d0932ef2caf74261a6a211497e3", "format":"json",
                    "album":album.URLEscapedString]
        }
    }
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .albumInfo, .albumSearch:
            return URLEncoding.queryString
        }
    }
    var sampleData: Data {
        switch self{
        case .albumSearch(_):
            guard let url = Bundle.main.url(forResource: "albumsearch", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            return data
        case .albumInfo( _, _):
            guard let url = Bundle.main.url(forResource: "albuminfo", withExtension: "json"),
                let data = try? Data(contentsOf: url) else {
                    return Data()
            }
            return data
        }
    }
    var task: Task {
        return .request
    }
    var validate: Bool {
        return false
    }


}
