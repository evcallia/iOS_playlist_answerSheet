//
//  AddSongToPlaylistTableViewController.swift
//  playlist
//
//  Created by Evan Callia on 2/22/17.
//  Copyright © 2017 Evan Callia. All rights reserved.
//

import UIKit

class AddSongToPlaylistTableViewController: UITableViewController {

    weak var delegate: AddSongToPlaylistDelegate?
    var playlist: Playlist!
    var songs = [Song]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    // MARK: - CORE DATA METHODS
    func fetchAllSongs(){
        do {
            let results = try managedObjectContext.fetch(Song.fetchRequest())
            songs = results as! [Song]
        } catch {
            print("\(error)")
        }
    }
    
    func saveData(){
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch {
                print("\(error)")
            }
        }
    }
    // END: CORE DATA

    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        cell.textLabel?.text = songs[indexPath.row].title
        cell.detailTextLabel?.text = songs[indexPath.row].artist
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addedSongs = playlist.songs?.mutableCopy() as! NSMutableOrderedSet
        addedSongs.add(songs[indexPath.row])
        playlist.songs = addedSongs.copy() as? NSOrderedSet
        saveData()
        delegate?.songAddedToPlaylist(by: self)
    }
    // END: Table View

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllSongs()
        songs = songs.filter{!(playlist.songs?.contains($0))!}
    }
}








