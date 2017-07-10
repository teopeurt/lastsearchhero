//
//  AlbumSearchCoordinator.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import Foundation
import RxSwift

final class AlbumSearchCoordinator: Coordinator {
    
    var albumSelected = PublishSubject<Album>()
    let disposeBag = DisposeBag()
    
    
    override init(navigationController: UINavigationController?) {
        super.init(navigationController: navigationController)
        
        albumSelected
            .subscribe(onNext: { albumnO in
                
                let viewModel = AlbumDetailsViewModel(album: albumnO)
                let viewController = AlbumDetailsViewController(viewModel: viewModel)
                self.navigationController?.pushViewController(viewController, animated: true)
              
            }).addDisposableTo(disposeBag)
    }
    
    func start() {
        let viewModel = AlbumSearchViewModel()
        let viewController = AlbumSearchViewController(viewModel: viewModel)
        
        viewModel.albumSelected.asObservable()
            .bind(to: albumSelected)
            .addDisposableTo(disposeBag)
        
        navigationController?.pushViewController(viewController, animated: true)
    }


}
