//
//  ReviewViewController.swift
//  kulinary
//
//  Created by Tommy Yon Prakoso on 27/06/22.
//

import UIKit
import CoreData

class ReviewViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var kulinaryCoreData = [Kulinary]()

    let delegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext {
        get {
            return delegate.persistentContainer.viewContext
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }

    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReviewTableViewCell.nib(), forCellReuseIdentifier: "ReviewTableViewCell")
    }

    func setupData() {
        let request = Kulinary.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            kulinaryCoreData = result
        } catch { }
    }
}

extension ReviewViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        kulinaryCoreData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ReviewTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        cell.data = kulinaryCoreData[indexPath.row]
        return cell
    }
}

