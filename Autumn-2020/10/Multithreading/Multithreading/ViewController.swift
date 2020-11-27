//
//  ViewController.swift
//  Multithreading
//
//  Created by p.nosov on 26.11.2020.
//

import UIKit

class TableViewController: UITableViewController {

    private let items: [Item] = [pthreadItem(name: "phread"),
                                 TreadItem(name: "Thread"),
                                 ThreadWithQOS(name: "Thread with quality of service"),
                                 MutexItem(name: "Sync with mutex"),
                                 RecursiveLock(name: "RecursiveLock"),
                                 ConditionItem(name: "NSCondition"),
                                 SerialQueueItem(name: "SerialQueue"),
                                 ConcurrentQueueItem(name: "ConcurrentQueue"),
                                 AsyncAfterItem(name: "AsyncAfter"),
                                 DWorkItem(name: "DispatchWorkItem"),
                                 SemaphoreItem(name: "Semaphore")
    ]
    private let taskSegue = "TaskViewControllerSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row].name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = items[indexPath.row]
        self.performSegue(withIdentifier: taskSegue, sender: item)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? TaskViewController, let sender = sender as? Item else {
            return
        }
        vc.item = sender
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }


}

