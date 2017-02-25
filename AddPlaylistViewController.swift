//
//  AddPlaylistViewController.swift
//  playlist
//
//  Created by Evan Callia on 2/22/17.
//  Copyright © 2017 Evan Callia. All rights reserved.
//

import UIKit

class AddPlaylistViewController: UIViewController {

    @IBOutlet weak var titleInput: UITextField!
    
    weak var delegate: AddPlaylistViewControllerDelegate?
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        delegate?.playlistCreated(by: self, with: titleInput.text!)
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
