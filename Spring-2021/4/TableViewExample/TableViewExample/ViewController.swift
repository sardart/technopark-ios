//
//  ViewController.swift
//  TableViewExample
//
//  Created by Artur Sardaryan on 3/22/21.
//

import UIKit

struct SomeModel {
    let text: String
    let needCheckmark: Bool
}

class ViewController: UIViewController {
        
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.frame
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 50
        case 1:
            return 100
        case 2:
            return 150
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as? MyTableViewCell else {
            return UITableViewCell()
        }
                
        switch indexPath.section {
        case 0:
            cell.backgroundColor = .blue
        case 1:
            cell.backgroundColor = .red
        case 2:
            cell.backgroundColor = .white
        default:
            break
        }
        
        let model = SomeModel(text: "Some text", needCheckmark: indexPath.row % 2 == 1)
        cell.configure(with: model)
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()

        switch section {
        case 0:
            view.backgroundColor = .systemPink
        case 1:
            view.backgroundColor = .systemTeal
        case 2:
            view.backgroundColor = .systemOrange
        default:
            break
        }

        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("willDisplay", indexPath)
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("didEndDisplaying", indexPath)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print(#function)
    }
}

final class MyTableViewCell: UITableViewCell {
    
    private let anotherImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: SomeModel) {
        textLabel?.text = model.text
        tintColor = .white
        imageView?.image = UIImage(systemName: "pencil")
        accessoryType = model.needCheckmark ? .checkmark : .none
    }
}
