//
//  TableViewController.swift
//  CustomTableView
//
//  Created by a.reshetnikov on 28/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController {

    let customIdentifier = "CustomTableViewCell"
    @IBOutlet weak var tableView: UITableView!
    private var dataSource = ImageDataSource()
    private var loadingQueue = OperationQueue()
    private var loadingOperation = [IndexPath: DataLoadOperation]()
    private var cachedImages = [IndexPath: UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.prefetchDataSource = self
        tableView.register(UINib.init(nibName: customIdentifier, bundle: nil), forCellReuseIdentifier: customIdentifier)
    }
}

extension TableViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print("\(indexPaths)")
        for indexPath in indexPaths {
            if let _ = loadingOperation[indexPath] { return }
            if let dataLoader = dataSource.loadImage(at: indexPath.row) {
                loadingQueue.addOperation(dataLoader)
                loadingOperation[indexPath] = dataLoader
            }
        }
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if let dataLoader = loadingOperation[indexPath] {
                dataLoader.cancel()
                loadingOperation.removeValue(forKey: indexPath)
            }
        }
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? CustomTableViewCell else { return }

        let updateCellClosure: (UIImage?) -> () = { [unowned self] (image) in
            if cell.tag == indexPath.row {
                cell.updateAppearanceFor(image)
            }
            self.loadingOperation.removeValue(forKey: indexPath)
            self.cachedImages[indexPath] = image
        }

        if let dataLoader = loadingOperation[indexPath] {
            if let image = dataLoader.image {
                cell.updateAppearanceFor(image)
                loadingOperation.removeValue(forKey: indexPath)
            } else {
                dataLoader.loadingCompletionHandler = updateCellClosure
            }
        } else {
            if let dataLoader = dataSource.loadImage(at: indexPath.row) {
                dataLoader.loadingCompletionHandler = updateCellClosure
                loadingQueue.addOperation(dataLoader)
                loadingOperation[indexPath] = dataLoader
            }
        }
    }

}

extension TableViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.numberOfImages
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewCell = tableView.dequeueReusableCell(withIdentifier: customIdentifier, for: indexPath) as? CustomTableViewCell else {
            fatalError("Cell should be not nil")
        }
        tableViewCell.tag = indexPath.row;
        tableViewCell.updateAppearanceFor(self.cachedImages[indexPath])
        return tableViewCell
    }
}

