//
//  AddSongViewControllerDelegate.swift
//  playlist
//
//  Created by Evan Callia on 2/22/17.
//  Copyright © 2017 Evan Callia. All rights reserved.
//

import Foundation
import UIKit

protocol AddSongViewControllerDelegate: class {
    func cancelButtonPressed(by controller: AddSongViewController)
    func songAdded(by controller: AddSongViewController, with title: String, and artist: String)
}
