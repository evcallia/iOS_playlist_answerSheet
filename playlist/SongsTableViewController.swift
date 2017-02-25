//
//  SongsTableViewController.swift
//  playlist
//
//  Created by Evan Callia on 2/22/17.
//  Copyright © 2017 Evan Callia. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController,AddSongViewControllerDelegate {
    
    var songs = [Song]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - AddSongViewControllerDelegate
    func cancelButtonPressed(by controller: AddSongViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func songAdded(by controller: AddSongViewController, with title: String, and artist: String) {
        dismiss(animated: true, completion: nil)
        let song = Song(context: managedObjectContext)
        song.title = title
        song.artist = artist
        saveData()
        songs.append(song)
        tableView.reloadData()
    }
    // END: AddSongViewControllerDelegate
    
    
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
        performSegue(withIdentifier: "ShowSong", sender: songs[indexPath.row])
    }
    // END: Table View

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSong"{
            let nav = segue.destination as! UINavigationController
            let controller = nav.topViewController as! AddSongViewController
            controller.delegate = self
        }else if segue.identifier == "ShowSong"{
            let controller = segue.destination as! ShowSongViewController
            controller.song = sender as! Song
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllSongs()
    }
}
