//
//  NewsTableViewController.swift
//  Test task
//
//  Created by Vova on 31.03.2022.
//
import UIKit

final class NewsTableViewController: UITableViewController {
    
    private let cellIdentifier: String = "Cell"
    private var news: [miniPost] = []
    private let urlAdress = "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/main.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchDataNews(url: urlAdress) { news in
            guard let news = news?.posts else { return }
            self.news = news
            
            // sorting
            // tag = 1 -- Новые новости
            // tag = 2 -- Популярные новости
            if SortViewController.tagSort == 1{
                self.news = self.news.sorted { (initial, next) -> Bool in
                    return (initial.timeshamp ?? 0) > (next.timeshamp ?? 0)
                }
                SortViewController.tagSort = 0
            }
            if SortViewController.tagSort == 2{
                self.news = self.news.sorted { (initial, next) -> Bool in
                    return (initial.likesCount ?? 0) > (next.likesCount ?? 0)
                }
                SortViewController.tagSort = 0
            }
            
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsTableViewCell
        //time display setting
        let locale = NSLocale.current
        let dateFormater = DateFormatter()
        dateFormater.locale = locale
        dateFormater.dateFormat = DateFormatter.dateFormat(fromTemplate: "MM.dd.yyyy HH:mm", options: 0, locale: locale)
        let date: Date = Date(timeIntervalSince1970: Double(news[indexPath.row].timeshamp ?? 0) )
        let dateStr = dateFormater.string(from: date)
        
        cell.titleLabelOutlet.text = news[indexPath.row].title
        cell.previewTextLabelOutlet.text = news[indexPath.row].previewText
        cell.likeLabelOutlet.text = "🖤\(news[indexPath.row].likesCount ?? 0)"
        cell.timeLabelOutlet.text = dateStr
        
        //Button display settings
        cell.previewTextLabelOutlet?.numberOfLines = 0
        if cell.previewTextLabelOutlet.numberOfVisibleLines < 3{
            cell.showAllButtonOutlet.isHidden = true
            cell.heightButtonOutlet.constant = 0
        } else{
            cell.showAllButtonOutlet.isHidden = false
            cell.previewTextLabelOutlet?.numberOfLines = 2
        }
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

extension UILabel {
    //extension to count rows
    var numberOfVisibleLines: Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(MAXFLOAT))
        let textHeight = sizeThatFits(maxSize).height
        let lineHeight = font.lineHeight
        return Int(ceil(textHeight / lineHeight) - 1)
    }
}
