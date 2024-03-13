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
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // - Variables: UI
    @IBOutlet weak var tableView: UITableView!
    
    // - Lifecycle: View
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
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
    
    func didLoadPosters() {
        // Out of scope
    }
}

// - TableView: Datasource Methods
extension PosterVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.posters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PosterCell.reuseId, for: indexPath) as? PosterCell
        else { fatalError("Fatal: @cellForRowAt()")}
        guard let data = viewModel.getPoster(at: indexPath)
        else { fatalError("Fatal2: @cellForRowAt()")}
        cell.configure(with: data)
        return cell
    }
}

// - TableView: Delegate Methods
extension PosterVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Navigate To Detail Page
    }
}

// - Extended: Helper Class Methods
extension PosterVC {
    // TODO: In-case
}
