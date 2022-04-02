//
//  PostViewController.swift
//  Test task
//
//  Created by Vova on 31.03.2022.
//

import UIKit

class PostViewController: UIViewController {

    var postID: Int = 0
    
    var url = "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/posts/[id].json"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         url = "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/posts/\(postID).json"

        
        
        print(url)
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
