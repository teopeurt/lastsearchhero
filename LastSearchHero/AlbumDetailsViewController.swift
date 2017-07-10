//
//  AlbumDetailsViewController.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AlbumDetailsViewController: UIViewController {

    @IBOutlet weak var albumTitle: UILabel!
    
    @IBOutlet weak var albumcover: UIImageView!

    @IBOutlet weak var artistName: UILabel!
    
    
    let imageService = DefaultImageService.sharedImageService
    
    var albumViewModel: AlbumDetailsViewModel!
    let disposeBag = DisposeBag()
    
    convenience init(viewModel: AlbumDetailsViewModel) {
        self.init()
        self.albumViewModel = viewModel
        
        downloadableImage =  Observable.empty()
    }
    
    var downloadableImage: Observable<DownloadableImage>?{
        didSet{
            self.downloadableImage?
                .asDriver(onErrorJustReturn: DownloadableImage.offlinePlaceholder)
                .drive(albumcover.rx.downloadableImageAnimated(kCATransitionFade))
                .disposed(by: disposeBag)
                }
    }
    
    func configureView() {
        albumViewModel.albumName
            .bind(to: self.navigationItem.rx.title)
            .addDisposableTo(disposeBag)
        
        albumViewModel.albumName
            .bind(to: self.albumTitle.rx.text)
            .addDisposableTo(disposeBag)
        
       albumViewModel.artist
            .bind(to: self.artistName.rx.text)
            .addDisposableTo(disposeBag)
        

        let url = self.albumViewModel.imageUrl!
        let reachabilityService = Dependencies.sharedDependencies.reachabilityService
        
        downloadableImage = self.imageService.imageFromURL(url, reachabilityService: reachabilityService)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

