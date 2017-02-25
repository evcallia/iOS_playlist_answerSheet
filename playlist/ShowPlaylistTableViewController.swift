//
//  ShowPlaylistTableViewController.swift
//  playlist
//
//  Created by Evan Callia on 2/22/17.
//  Copyright © 2017 Evan Callia. All rights reserved.
//

import UIKit

class ShowPlaylistTableViewController: UITableViewController,AddSongToPlaylistDelegate {

    var playlist: Playlist!

    @IBAction func addSongPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddSongToPlaylist", sender: sender)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist.songs!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        cell.textLabel?.text = (playlist.songs?[indexPath.row] as! Song).title
        cell.detailTextLabel?.text = (playlist.songs?[indexPath.row] as! Song).artist
        return cell
    }
    // END: Table View
    
    
    // MARK: - AddSongToPlaylistDelegate
    func songAddedToPlaylist(by controller: AddSongToPlaylistTableViewController) {
        _ = navigationController?.popViewController(animated: true)
        tableView.reloadData()
    }
    // END: AddSongToPlaylistDelegate
    

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSongToPlaylist"{
            let controller = segue.destination as! AddSongToPlaylistTableViewController
            controller.delegate = self
            controller.playlist = playlist
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = playlist.title
    }
}










