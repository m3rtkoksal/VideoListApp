//
//  VideoListTableViewCell.swift
//  VideoListApp
//
//  Created by Mert Köksal on 24.06.2022.
//

import UIKit

class VideoListTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: VideoListTableViewCell.self)

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: VideoModule.VideoViewModel) {
        titleLabel.label(textStr: model.videoModel.title, textColor: .black, textFont: .systemFont(ofSize: 16, weight: .semibold), lineSpacing: -0.16, paragraphStyle: NSMutableParagraphStyle())
        subtitleLabel.label(textStr: model.videoModel.author.name, textColor: .systemGray, textFont: .systemFont(ofSize: 13, weight: .bold), lineSpacing: -0.13, paragraphStyle: NSMutableParagraphStyle())
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension VideoListTableViewCell: Reusable, NibLoadable { }
