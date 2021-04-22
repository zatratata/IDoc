//
//  ConsultationsViewController.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class ConsultationsViewController: UIViewController {
    
    private let viewModel = ConsultationViewModel()
    private let disposeBag = DisposeBag()
    
    private let dataSource = RxTableViewSectionedReloadDataSource<ConsultationViewModel.SectionModel> {
        (dataSource, tableView, indexPath, item) -> UITableViewCell in
        
        if let item = item as? ConsultationCategories {
            let cell = tableView.dequeueReusableCell(withIdentifier: RectangleImageTitleTextCell.cellID,
                                                     for: indexPath) as! RectangleImageTitleTextCell
            cell.setupCell(with: item)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: CyrcleImageTitleTextCell.cellID,
                                                     for: indexPath) as! CyrcleImageTitleTextCell
            cell.setupCell(with: item)
            return cell
        }
    }
    
    //MARK: - GUI
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        bindSelectRow()
    }
    
    //MARK: - Methods
    private func setup() {
        tableView.register(UINib(nibName: RectangleImageTitleTextCell.cellID, bundle: nil),
                           forCellReuseIdentifier: RectangleImageTitleTextCell.cellID)
        tableView.register(UINib(nibName: CyrcleImageTitleTextCell.cellID, bundle: nil),
                           forCellReuseIdentifier: CyrcleImageTitleTextCell.cellID)
        
        viewModel.items
            .drive(tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        searchBar.rx.text
            .debounce(.milliseconds(500), scheduler: ConcurrentMainScheduler.instance)
            .distinctUntilChanged()
            .bind(to: viewModel.queryChanged)
            .disposed(by: disposeBag)
    }
    
    private func bindSelectRow() {
        tableView.rx
          .modelSelected(ConsultationCategories.self)
          .subscribe(onNext: { model in
            self.navigationController?.pushViewController(AdultsViewController(), animated: true)
          })
          .disposed(by: disposeBag)
    }
}
