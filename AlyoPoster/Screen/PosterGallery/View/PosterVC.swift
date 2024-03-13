//
//  ViewController.swift
//  AlyoPoster
//
//  Created by Sefa İbiş on 13.03.2024.
//

import UIKit

// - Class: Contract
protocol ContractForPosterVC: AnyObject {
    func setupTableView()
}

// MARK: CLASS
final class PosterVC: UIViewController {
    
    // - Variables: MVVM
    private lazy var viewModel: ContractForPosterVM = PosterVM(view: self)
    
    // - Lifecycle: Object
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // - Variables: UI
    @IBOutlet weak var tableView: UITableView!
    
    // - Lifecycle: View
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// - Conformance: Class Contract 
extension PosterVC: ContractForPosterVC {
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: PosterCell.nibName, bundle: nil), forCellReuseIdentifier: PosterCell.reuseId)
    }
}

// - Nofity: MVVM

extension PosterVC: DelegateOfPosterVM {
    // TODO:
}

// - TableView: Datasource Methods

extension PosterVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: get value
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: return configured posterCell()
        return UITableViewCell()
    }
}

// - TableView: Delegate Methods

extension PosterVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Navigate to detail if you want
    }
}

// - Extended: Helper Class Methods
 
extension PosterVC {
    
    // TODO: In-case
}
