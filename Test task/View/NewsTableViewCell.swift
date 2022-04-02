//
//  NewsTableViewCell.swift
//  Test task
//
//  Created by Vova on 02.04.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabelOutlet: UILabel!
    @IBOutlet weak var previewTextLabelOutlet: UILabel!
    @IBOutlet weak var likeLabelOutlet: UILabel!
    @IBOutlet weak var showAllButtonOutlet: UIButton!
    @IBOutlet weak var timeLabelOutlet: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func showAllButtonAction(_ sender: UIButton) {
    }
}
