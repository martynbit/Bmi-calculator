//
//  ThirdViewController.swift
//  Bmi calculator
//
//  Created by Martynas Tamulionis on 09/07/2018.
//  Copyright © 2018 Martynas. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var resultsTableView: UITableView!
    
    var list = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        print(list)
    }
    
    @IBAction func goBackBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension ThirdViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell")
        cell!.textLabel?.text = list[indexPath.row]
        cell!.backgroundColor = UIColor.clear
        return cell!
    }
}


