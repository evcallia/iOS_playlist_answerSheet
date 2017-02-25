//
//  ShowSongViewController.swift
//  playlist
//
//  Created by Evan Callia on 2/22/17.
//  Copyright © 2017 Evan Callia. All rights reserved.
//

import UIKit

class ShowSongViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var song: Song!
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if song.playlists?.count == 0{
            return 1
        }
        return song.playlists!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        if song.playlists?.count == 0{
            cell.textLabel?.text = "This song is not in a playlist"
            cell.detailTextLabel?.text = ""
        }else{
            cell.textLabel?.text = (song.playlists?[indexPath.row] as! Playlist).title
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd yyy"
            cell.detailTextLabel?.text = formatter.string(from:(song.playlists?[indexPath.row] as! Playlist).createdAt as! Date)
        }
        return cell
    }

    // END: TableView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel?.text = song.title
        artistLabel?.text = song.artist
        tableView.dataSource = self
    }
}
