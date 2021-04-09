//
//  PersonalCabinetViewController.swift
//  iDoc
//
//  Created by Default User on 4/8/21.
//

import UIKit
import RxCocoa
import RxSwift

final class PersonalCabinetViewController: UIViewController {
    
    private let viewModel = MenuWithTableViewModel()
    private let disposeBag = DisposeBag()
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Methods
    private func setup() {
        tableView.register(UINib(nibName: ImageLabelArrowCell.cellID, bundle: nil),
                           forCellReuseIdentifier: ImageLabelArrowCell.cellID)
        viewModel.tableModel.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: ImageLabelArrowCell.cellID)) {
                (index, model: MenuCellModel, cell: ImageLabelArrowCell) in
                cell.setupCell(with: model)
            }
            .disposed(by: disposeBag)
        viewModel.setupTable(page: .personalCabinet)
    }
}
