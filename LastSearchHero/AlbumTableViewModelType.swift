//
// Created by d onwunumah on 09/07/2017.
// Copyright (c) 2017 d onwunumah. All rights reserved.
//

import RxSwift

protocol AlbumTableViewModelType{
     var name: Observable<String> { get }
     var artist: Observable<String> { get }
}
