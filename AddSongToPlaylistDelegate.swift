//
//  AddSongToPlaylistDelegate.swift
//  playlist
//
//  Created by Evan Callia on 2/22/17.
//  Copyright © 2017 Evan Callia. All rights reserved.
//

import Foundation
import UIKit

protocol AddSongToPlaylistDelegate: class{
    func songAddedToPlaylist(by controller: AddSongToPlaylistTableViewController)
}
