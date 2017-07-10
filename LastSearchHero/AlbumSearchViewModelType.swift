//
// Created by d onwunumah on 09/07/2017.
// Copyright (c) 2017 d onwunumah. All rights reserved.
//

import RxSwift

protocol AlbumSearchViewModelType {

    var errorObservable: Observable<String> {get}
    var albumresultsObservable: Observable<[AlbumTableViewModelType]> {get}
    var itemSelected: PublishSubject<IndexPath> {get}

}
