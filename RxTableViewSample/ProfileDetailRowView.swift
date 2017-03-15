//
//  ProfileDetailRowView.swift
//  RxTableViewSample
//
//  Created by Ranjeet Kumar Singh on 3/15/17.
//  Copyright © 2017 Ranjeet. All rights reserved.
//

import UIKit

class ProfileDetailRowView: UIView {

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    func setupView(icon:UIImage, text: String) -> Void {
        self.detailLabel.text = text;
        self.iconImageView.image = icon
    }
}
