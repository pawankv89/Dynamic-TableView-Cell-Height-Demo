//
//  ViewController.swift
//  DynamicCellHeight Demo
//
//  Created by Pawan kumar on 31/03/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let moviesList = MovieDataSource.moviesList()
    
    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.dataSource = self
        tableview.estimatedRowHeight = 80
        tableview.rowHeight = UITableView.automaticDimension
        //tableview.register(BookCell.self, forCellReuseIdentifier: BookCell.identifire)
        tableview.register(UINib(nibName: MovieCell.identifire, bundle: nil), forCellReuseIdentifier: MovieCell.identifire)
        
        //Convert Model Object To Json String
        //let movie = moviesList[0]
        //let json = movie.convertToDict()
        //print("json:-\(json)")
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: MovieCell.identifire, for: indexPath) as! MovieCell
        
        let movie = moviesList[indexPath.row]
        cell.titleLabel.text = movie.name
        cell.subtitleLabel.text = movie.details
        return cell
    }
    
}
