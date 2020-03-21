//
//  ViewController.swift
//  CTUniversalModel
//
//  Created by casa on 2020/3/21.
//  Copyright © 2020 casa. All rights reserved.
//

import UIKit
import SwiftHandyFrame

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.hf.fill()
    }

    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.textLabel?.text = dataSource[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let testClass = TestClassModel()
            print("\(String(describing: testClass.name))")
            
            let testStruct = TestStructModel()
            print("\(String(describing: testStruct.name))")
        }
    }
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    // MARK: getters and setters
    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    lazy var dataSource:[String] = [
        "fetch CTUniversalModel from struct",
        "fetch Array from struct",
        "fetch Int from struct",
        "fetch string from struct",
        "set CTUniversalModel to struct",
        "set Array to struct",
        "set Int to struct",
        "set string to struct",
        "fetch CTUniversalModel from class",
        "fetch Array from class",
        "fetch Int from class",
        "fetch string from class",
        "set CTUniversalModel to class",
        "set Array to class",
        "set Int to class",
        "set string to class",
    ]

}

