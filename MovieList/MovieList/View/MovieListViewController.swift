//
//  ViewController.swift
//  MovieList
//
//  Created by Rayan MEHDI on 14/12/2022.
//

import UIKit

class MovieListViewController: UIViewController {
    
    //MARK: - Outltets
    
    @IBOutlet weak var movieListTableView: UITableView!
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        movieListTableView.dataSource = self
                
        // Do any additional setup after loading the view.
    }

}

//MARK: - tableview datasource

extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath) as! MovieListCell
        
        cell.titleLabel.text = "TEST"
        
        return cell
    }
}
