//
//  PostViewController.swift
//  Test task
//
//  Created by Vova on 31.03.2022.
//

import UIKit

class PostViewController: UIViewController {
    @IBOutlet weak var titleLabelOutlet: UILabel!
    @IBOutlet weak var textLabelOutlet: UILabel!
    
    var postID: Int = 0
    // MARK: - Private properties
    private var post: PostClass?
    private var urlAdress = "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/posts/[id].json"
    
    // MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlAdress = "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/posts/\(postID).json"
        
        print(urlAdress)

        
        NetworkManager.shared.fetchDataPost(url: urlAdress) { post in
            guard let post = post?.post else { return }
            self.post = post
            
            self.titleLabelOutlet.text = post.title
            self.textLabelOutlet.text = post.text
        }
        

    }
        /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
