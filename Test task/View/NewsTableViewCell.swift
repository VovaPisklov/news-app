//
//  NewsTableViewCell.swift
//  Test task
//
//  Created by Vova on 02.04.2022.
//
import UIKit

final class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabelOutlet: UILabel!
    @IBOutlet weak var previewTextLabelOutlet: UILabel!
    @IBOutlet weak var likeLabelOutlet: UILabel!
    @IBOutlet weak var showAllButtonOutlet: UIButton!
    @IBOutlet weak var heightButtonOutlet: NSLayoutConstraint!
    @IBOutlet weak var timeLabelOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        showAllButtonOutlet.setTitle("Показать полностью", for: .normal)
        showAllButtonOutlet.setTitle("Скырть текст", for: .selected)
    }
    
    @IBAction func showAllButtonAction(_ sender: UIButton) {
        showAllButtonOutlet.isSelected = !showAllButtonOutlet.isSelected
        if sender.isSelected{
            previewTextLabelOutlet.numberOfLines = 0   //Проблемка
        } else {
            previewTextLabelOutlet.numberOfLines = 2
        }
    }
}
