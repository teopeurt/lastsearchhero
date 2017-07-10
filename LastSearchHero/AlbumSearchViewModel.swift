//
//  AlbumSearchViewModel.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa


final class AlbumSearchViewModel: AlbumSearchViewModelType {
    
    private let error  = PublishSubject<String>()
    private let searchResults = Variable<[(Album, AlbumTableViewModelType)]>([])
    private let provider = RxMoyaProvider<LastFmService>()
    private let disposeBag = DisposeBag()
    
    var albumSearchModel: AlbumSearchModel!
    var albumSelected = PublishSubject<Album>()

    let itemSelected: PublishSubject<IndexPath> = PublishSubject<IndexPath>()
    var searchString: PublishSubject<String>!

    lazy var errorObservable: Observable<String> = self.error.asObservable()
    lazy  var albumresultsObservable: Observable<[AlbumTableViewModelType]> = self.searchResults.asObservable().map { $0.map { $0.1 } }

    init() {

        itemSelected
            .map { [weak self] in self?.searchResults.value[$0.row]}
            .subscribe(onNext: { [weak self] searchResult in
                guard let `self` = self, let searchResult = searchResult else { return }
                `self`.albumSelected
                    .onNext(searchResult.0)
                })
            .addDisposableTo(disposeBag)
    
    }
    
    
    func doAlbumSearch(searchString: String){
        
        provider
            .request(.albumSearch(album: searchString)) { [weak self] result in
            guard let `self` = self else { return }
            
            switch result {
            case let .success(response):
                do {
                
                    //debugPrint("HTTP Response Body: \(response.data)")
                    let res = try response.mapObject() as AlbumSearchResults
                    
                    if let res2 = res.albummatches?.album {
                        self.searchResults.value = res2.map { ($0, AlbumTableViewModel(album: $0)) }
                    }
                    
                    // reload table view
                } catch {
                    self.error.onNext("Parsing error. Try again later.")
                }
            case .failure:
                self.error.onNext("Request error. Try again later.")
                }
        }
  
    }

}
