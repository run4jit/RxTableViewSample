//
//  ContactDetailViewController.swift
//  RxTableViewSample
//
//  Created by Ranjeet Kumar Singh on 3/15/17.
//  Copyright © 2017 Ranjeet. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {

    private var contactDetailViewModel: ContactDetailViewModel?
    
    @IBOutlet weak var nameView: ProfileDetailRowView!
    @IBOutlet weak var mobileView: ProfileDetailRowView!
    @IBOutlet weak var emailView: ProfileDetailRowView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
