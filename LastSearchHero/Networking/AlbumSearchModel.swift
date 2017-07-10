//
//  AlbumSearchModel.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//
import Foundation
import Moya
import Mapper
import Moya_ModelMapper
import RxOptional
import RxSwift


struct AlbumSearchModel {
    
    
    let provider: RxMoyaProvider<LastFmService>
    let albumName: Observable<String>
    //let repositoryName: Observable<String>

    
//    func trackIssues() -> Observable<[Album]> {
//        return albumName
//            .observeOn(MainScheduler.instance)
//            .flatMapLatest { name ->  Observable<Album?> in
//                print("Name: \(name)")
//                return self
//                    .findAlbum(name)
//            }
////            .flatMapLatest { repository -> Observable<[Album]?> in
////                guard let searchResults = repository else { return Observable.just(nil) }
////                
////                print("Repository: \(searchResults)")
////                return self.findAlbumInfo(searchResults)
////            }
//            .replaceNilWith([])
//    }
//    
    
    
//    internal func findAlbum(_ name: String) -> Observable<Album?> {
//        return self.provider
//            .request(LastFmService.albumSearch(name))
//            .debug()
//            .mapObjectOptional(type: Repository.self)
//    }
    
//    internal func findAlbumInfo(_ albumname: String) -> Observable<[Album]?> {
//        return self.provider
//            .request(LastFmService.albumInfo(albumname, artistname))
//            .debug()
//            .mapArrayOptional(type: Issue.self)
//    }

    
    
}
