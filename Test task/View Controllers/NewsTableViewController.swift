//
//  NewsTableViewController.swift
//  Test task
//
//  Created by Vova on 31.03.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    // MARK: - Private properties
    private let cellIdentifier: String = "Cell"
    private var news: [miniPost] = []
    private let urlAdress = "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/main.json"

    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchDataNews(url: urlAdress) { news in
            guard let news = news?.posts else { return }
            self.news = news
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsTableViewCell
        let date: Date = Date(timeIntervalSince1970: Double(news[indexPath.row].timeshamp ?? 0) )
        
        cell.titleLabelOutlet.text = news[indexPath.row].title
        cell.previewTextLabelOutlet.text = news[indexPath.row].previewText
        cell.likeLabelOutlet.text = "🖤\(news[indexPath.row].likesCount ?? 0)"
        cell.timeLabelOutlet.text = "\(date)"

        
//        cell.textLabel?.text = String(news[indexPath.row].timeshamp!)
//        cell.textLabel?.numberOfLines = 2
        return cell
    }
    
    
    
    //  MARK: - Navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "ShowDetail" {
             if let indexPath = self.tableView.indexPathForSelectedRow{
                 let postViewController = segue.destination as! PostViewController
                 postViewController.postID = news[indexPath.row].postID ?? 0
             }
         }
     }
    
}
