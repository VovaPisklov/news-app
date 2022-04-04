//
//  PostViewController.swift
//  Test task
//
//  Created by Vova on 31.03.2022.
//

import UIKit

final class PostViewController: UIViewController {
    @IBOutlet weak var titleLabelOutlet: UILabel!
    @IBOutlet weak var previewTextViewOutlet: UITextView!
    @IBOutlet weak var likesCountLabelOutlet: UILabel!
    @IBOutlet weak var timeshampLabelOutlet: UILabel!
    
    var postID: Int = 0
    
    private var post: PostClass?
    private var urlAdress = "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/posts/[id].json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlAdress = "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/posts/\(postID).json"
        
        NetworkManager.shared.fetchDataPost(url: urlAdress) { post in
            guard let post = post?.post else { return }
            
            //time display setting
            let locale = NSLocale.current
            let dateFormater = DateFormatter()
            dateFormater.locale = locale
            dateFormater.dateFormat = DateFormatter.dateFormat(fromTemplate: "MM.dd.yyyy HH:mm", options: 0, locale: locale)
            let date: Date = Date(timeIntervalSince1970: Double(post.timeshamp ?? 0) )
            let dateStr = dateFormater.string(from: date)
            
            self.post = post
            self.titleLabelOutlet.text = post.title
            self.previewTextViewOutlet.text = post.text
            self.likesCountLabelOutlet.text = "🖤 \(post.likesCount ?? 0)"
            self.timeshampLabelOutlet.text = dateStr
        }
    }
}
