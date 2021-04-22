//
//  ReusableTableViewController.swift
//  iDoc
//
//  Created by Default User on 4/16/21.
//

import UIKit
import RxSwift
import RxCocoa

final class ReusableTableViewController: UIViewController {
    
    private var viewModel: ReusableTableViewModel?
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    //MARK: - Methods
    func setup(with model: [MenuCellModel]) {
        self.viewModel = ReusableTableViewModel(model: model)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: CyrcleImageTitleTextCell.cellID, bundle: nil),
                           forCellReuseIdentifier: CyrcleImageTitleTextCell.cellID)
        viewModel?.tableModel.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: CyrcleImageTitleTextCell.cellID)) {
                (index, model: MenuCellModel, cell: CyrcleImageTitleTextCell) in
                cell.setupCell(with: model)
            }
            .disposed(by: disposeBag)
    }
}
