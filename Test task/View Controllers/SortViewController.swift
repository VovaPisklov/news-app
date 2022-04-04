//
//  SortViewController.swift
//  Test task
//
//  Created by Vova on 05.04.2022.
//

import UIKit

class SortViewController: UIViewController {
    static var tagSort: Int?
    
    @IBAction func buttonPressedAction(_ sender: UIButton) {
        SortViewController.tagSort = sender.tag
    }
}
