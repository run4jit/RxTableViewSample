//
//  ContactTableViewCell.swift
//  Contact
//
//  Created by Ranjeet on 23/02/17.
//  Copyright © 2017 Ranjeet. All rights reserved.
//

import Foundation
import UIKit

class ContactTableViewCell: UITableViewCell {
    
    static let Identifier = "ContactTableViewCell"
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    func updateView(contact: Contact) {
        self.nameLabel.text = contact.name
        self.profileImageView.image = ContactManager.share.profileImage(url: contact.profileImageUrl)
    }
}
