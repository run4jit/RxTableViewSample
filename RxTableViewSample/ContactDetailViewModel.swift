//
//  ContactDetailViewModel.swift
//  RxTableViewSample
//
//  Created by Ranjeet Kumar Singh on 3/15/17.
//  Copyright © 2017 Ranjeet. All rights reserved.
//

import UIKit

class ContactDetailViewModel: NSObject {
    var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
}
