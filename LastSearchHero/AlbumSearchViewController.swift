//
//  AlbumSearchViewController.swift
//  LastSearchHero
//
//  Created by d onwunumah on 09/07/2017.
//  Copyright © 2017 d onwunumah. All rights reserved.
//

import UIKit
import Moya
import Moya_ModelMapper
import UIKit
import RxOptional
import RxCocoa
import RxSwift

class AlbumSearchViewController: UIViewController {

    var detailViewController: AlbumDetailsViewController? = nil
    var objects = [Any]()
    
    let disposeBag = DisposeBag()
    var viewModel: AlbumSearchViewModel!
 
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
     var albumSearchName: Observable<String> {
        return self.searchBar.rx.text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
     }
    
    convenience init(viewModel: AlbumSearchViewModel) {
        self.init()
        
        self.viewModel = viewModel
    

    }


    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "AlbumTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "albumCell")
        
        tableView.rx.itemSelected
            .bind(to: viewModel.itemSelected)
            .addDisposableTo(disposeBag)
        
        viewModel.albumresultsObservable
            .bind(to: tableView.rx.items) { tableView, i, item in
                let indexPath = IndexPath(row: i, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumTableViewCell
                cell.viewModel = item
                
                return cell
            }
            .addDisposableTo(disposeBag)
        
        viewModel.errorObservable
            .subscribe(onNext: { [weak self] error in
                self?.showAlert("Error", message: error)
            })
            .addDisposableTo(disposeBag)
        
        tableView
            .rx.itemSelected
            .subscribe(onNext: { indexPath in
                if self.searchBar.isFirstResponder == true {
                    self.view.endEditing(true)
                }
            })
            .addDisposableTo(disposeBag)
        
        albumSearchName
            .subscribe(onNext: {  [weak self] name in
                self?.viewModel.doAlbumSearch(searchString: name)
            })
            .addDisposableTo(disposeBag)
    }

    func insertNewObject(_ sender: Any) {
        objects.insert(NSDate(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    fileprivate func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(ok)
        present(alertController, animated: true, completion: nil)
    }

}

