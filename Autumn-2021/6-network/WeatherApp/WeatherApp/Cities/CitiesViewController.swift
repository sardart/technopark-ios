//
//  CitiesViewController.swift
//  WeatherApp
//
//  Created by Artur Sardaryan on 29.10.2021.
//  
//

import UIKit
import PinLayout

final class CitiesViewController: UIViewController {
    private let tableView = UITableView()
    
	private let output: CitiesViewOutput

    init(output: CitiesViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                 target: self,
                                                 action: #selector(didTapAddButton))
        
        navigationItem.rightBarButtonItem = rightBarButtonItem
        
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CityTableViewCell.self, forCellReuseIdentifier: "CityTableViewCell")
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        view.addSubview(tableView)
        output.didLoadView()
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.pin.all()
    }
    
    @objc
    private func didTapAddButton() {
        output.didTapAddButton()
    }
    
    @objc
    private func didPullToRefresh() {
        output.didPullToRefresh()
    }
}

extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell") as? CityTableViewCell
        
        cell?.configure(with: output.item(at: indexPath.row))
        
        return cell ?? .init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.itemsCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension CitiesViewController: CitiesViewInput {
    func reloadData() {
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
}
