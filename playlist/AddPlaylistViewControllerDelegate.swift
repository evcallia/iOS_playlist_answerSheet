//
//  AddPlaylistViewControllerDelegate.swift
//  playlist
//
//  Created by Evan Callia on 2/22/17.
//  Copyright © 2017 Evan Callia. All rights reserved.
//

import Foundation
import UIKit

protocol AddPlaylistViewControllerDelegate: class {
    func playlistCreated(by controller: AddPlaylistViewController, with title: String)
    func cancelButtonPressed(by controller: AddPlaylistViewController)
}
