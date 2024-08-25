//
//  DLCVC.swift
//  DBDInfo
//
//  Created by Timur Murzakov on 8/22/24.
//

// TODO: Table View to Collection View (maybe like table view or like 1x1)
// TODO: Change navigation bar text color to white

import UIKit

class DLCVC: UIViewController {
    
    let tableView   = UITableView()
    var DLCs        = DLC.mainDLC
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    private func configureVC() {
        title = "DLCs"
        view.backgroundColor = Colors.mainBackground
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.frame     = view.bounds
        tableView.rowHeight = 70
        tableView.register(DLCCell.self, forCellReuseIdentifier: DLCCell.reuseID)
        tableView.dataSource = self
        tableView.delegate   = self
        tableView.backgroundColor = Colors.mainBackground
        tableView.separatorStyle = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension DLCVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.DLCs.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DLCCell.reuseID) as! DLCCell
        let dlc  = DLCs[indexPath.section]
        cell.set(dlc: dlc)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = Colors.mainBackground
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dlc     = DLCs[indexPath.section]
        let destVC  = DLCInfoVC(dlc: dlc)
        
        navigationController?.pushViewController(destVC, animated: true)
    }
}
