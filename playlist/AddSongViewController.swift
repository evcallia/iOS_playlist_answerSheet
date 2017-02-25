//
//  AddSongViewController.swift
//  playlist
//
//  Created by Evan Callia on 2/22/17.
//  Copyright © 2017 Evan Callia. All rights reserved.
//

import UIKit

class AddSongViewController: UIViewController {

    @IBOutlet weak var songTitle: UITextField!
    @IBOutlet weak var artistInput: UITextField!
    
    weak var delegate: AddSongViewControllerDelegate?
    
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        delegate?.songAdded(by: self, with: songTitle.text!, and: artistInput.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
