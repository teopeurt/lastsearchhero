//
//  AlbumTableViewCell.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import UIKit
import RxSwift

class AlbumTableViewCell : UITableViewCell {
    
    @IBOutlet weak var artistOutlet: UILabel!
    @IBOutlet weak var titleOutlet: UILabel!
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    private var disposeBag = DisposeBag()

    var viewModel: AlbumTableViewModelType? {
        
        willSet {
            disposeBag = DisposeBag()
        }
        didSet {
            setupBindings()
        }

    }
    
    func setupBindings() {
        guard let viewModel = viewModel, let textLabel = textLabel, let detailTextLabel = detailTextLabel else { return }
        
        viewModel.name.bind(to: textLabel.rx.text).addDisposableTo(disposeBag)
        viewModel.artist.bind(to: detailTextLabel.rx.text).addDisposableTo(disposeBag)
    }
}
