//
//  ViewController.swift
//  Demo
//
//  Created by 1amageek on 2018/07/02.
//  Copyright © 2018年 Stamp Inc. All rights reserved.
//

import UIKit
import Firebase
import Pring

class ViewController: UITableViewController {

    var dataSource: DataSource<Post>?

    override func loadView() {
        super.loadView()
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = Post.query.dataSource()
        self.dataSource?
            .on({ [weak self] (snapshot, changes) in
                guard let tableView: UITableView = self?.tableView else { return }
                switch changes {
                case .initial:
                    tableView.reloadData()
                case .update(let deletions, let insertions, let modifications):
                    tableView.beginUpdates()
                    tableView.insertRows(at: insertions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                    tableView.deleteRows(at: deletions.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                    tableView.reloadRows(at: modifications.map { IndexPath(row: $0, section: 0) }, with: .automatic)
                    tableView.endUpdates()
                case .error(let error):
                    print(error)
                }
            }).listen()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TableViewCell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let post: Post = self.dataSource![indexPath.item]
        cell.set(post: post)
        return cell
    }

    @IBAction func showPostViewController(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "PostViewController", bundle: nil)
        let viewController: UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        self.present(viewController, animated: true, completion: nil)
    }
}
