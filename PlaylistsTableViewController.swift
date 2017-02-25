//
//  PlaylistsTableViewController.swift
//  playlist
//
//  Created by Evan Callia on 2/22/17.
//  Copyright © 2017 Evan Callia. All rights reserved.
//

import UIKit

class PlaylistsTableViewController: UITableViewController,AddPlaylistViewControllerDelegate {

    var playlists = [Playlist]()
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // MARK: - AddPlaylistViewControllerDelegate
    func playlistCreated(by controller: AddPlaylistViewController, with title: String) {
        dismiss(animated: true, completion: nil)
        let playlist = Playlist(context: managedObjectContext)
        playlist.title = title
        playlist.createdAt = NSDate()
        saveData()
        playlists.append(playlist)
        tableView.reloadData()
    }
    
    func cancelButtonPressed(by controller: AddPlaylistViewController) {
        dismiss(animated: true, completion: nil)
    }
    // END: AddPlaylistViewControllerDelegate
    
    
    // MARK: - CORE DATA METHODS
    func fetchAllPlaylists(){
        do {
            let results = try managedObjectContext.fetch(Playlist.fetchRequest())
            playlists = results as! [Playlist]
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
        return playlists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        cell.textLabel?.text = playlists[indexPath.row].title
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        cell.detailTextLabel?.text = formatter.string(for: playlists[indexPath.row].createdAt!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowPlaylist", sender: playlists[indexPath.row])
    }
    //END: TableView data source

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPlaylist"{
            let nav = segue.destination as! UINavigationController
            let controller = nav.topViewController as! AddPlaylistViewController
            controller.delegate = self
        }else if segue.identifier == "ShowPlaylist"{
            let controller = segue.destination as! ShowPlaylistTableViewController
            controller.playlist = sender as! Playlist
        }
    }
    // END: Navigation

    @IBAction func unwindToPlaylists(for segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllPlaylists()
    }
}
















