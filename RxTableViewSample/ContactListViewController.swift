//
//  ContactListViewController.swift
//  Contact
//
//  Created by Ranjeet on 22/02/17.
//  Copyright © 2017 Ranjeet. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ContactListViewController: UIViewController {
    @IBOutlet weak var contactTableView: UITableView!
    
    let contactListViewModel = ContactListViewModel()
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupCellConfiguration()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func setupCellConfiguration() {
        //Equivalent of cell for row at index path
        contactTableView.register(UINib(nibName: ContactTableViewCell.Identifier, bundle: nil), forCellReuseIdentifier: ContactTableViewCell.Identifier)
        
        contactTableView.rowHeight = 70
        
        self.contactListViewModel
            .contacts
            .asObservable()
            .bindTo(contactTableView
                .rx
                .items(cellIdentifier: ContactTableViewCell.Identifier,
            cellType: ContactTableViewCell.self)) {
            (row: Int, contact: Contact, cell: ContactTableViewCell) in
            cell.updateView(contact: contact)
            }
            .addDisposableTo(disposeBag)

        
        self.contactTableView
            .rx
            .itemSelected
            .map { indexPath in
                return (indexPath, self.contactListViewModel.contact(for: indexPath))
            }
            .subscribe(onNext: { indexPath, model in
                self.performSegue(withIdentifier: "ContactDetailViewController", sender: nil)
//                DefaultWireframe.presentAlert("Tapped `\(model)` @ \(indexPath)")
            })
            .disposed(by: disposeBag)
    }
    
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        <#code#>
    }
}

