
//  listNotesVC.swift
//  MyNotesApp
//
//  Created by Islam Gharib on 10/18/18.
//  Copyright © 2018 Gharib. All rights reserved.
//

import UIKit
import CoreData
class listNotesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var notesTableView: UITableView!
    var listNotes = [MyNotes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notesTableView.dataSource = self
        notesTableView.delegate = self
        loadNotes()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: notesTVC = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath) as! notesTVC
        cell.setNotes(note: listNotes[indexPath.row])
        
        // to listen to delete button
        cell.deleteBtn.tag = indexPath.row
        cell.deleteBtn.addTarget(self, action: #selector(buDeletePress(_:)), for: .touchUpInside)
        // to listen to edit button
        cell.editBtn.tag = indexPath.row
        cell.editBtn.addTarget(self, action: #selector(buEditPress(_:)), for: .touchUpInside)
        
        return cell
    }
    
    // delet note objective c
    @objc func buDeletePress(_ sender: UIButton){
      //  print("sender is \(sender.tag)")
        context.delete(listNotes[sender.tag])
        loadNotes()
    }
    // edit note objective c
    @objc func buEditPress(_ sender: UIButton){
        // when press edit button it will invoke prefer for seg func to move the data then return to the performseg func to return to the viewController.swift
        performSegue(withIdentifier: "editOrAddSegue", sender: listNotes[sender.tag])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editOrAddSegue"{
            if let addOrEdit = segue.destination as? ViewController{
                if let mynote = sender as? MyNotes{
                    addOrEdit.EditNote = mynote
                }
            }
        }
        // when moving to the ViewController Page delete the listNotesVC from memory
        // dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func addBtn(_ sender: Any) {
        performSegue(withIdentifier: "editOrAddSegue", sender: nil)
    }
    
    
    func loadNotes(){
        let fetchRequest: NSFetchRequest<MyNotes> = MyNotes.fetchRequest()
        
        do {
            listNotes = try context.fetch(fetchRequest)
            notesTableView.reloadData()
        } catch{
            print("Can't read from database")
        }
    }

    
}
