
//  ViewController.swift
//  MyNotesApp
//
//  Created by Islam Gharib on 10/18/18.
//  Copyright © 2018 Gharib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var noteTitleTF: UITextField!
    @IBOutlet weak var noteDetailsTV: UITextView!
    
    // accessed when pressing the edit button on notesTVC
    var EditNote:MyNotes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // if EditNote != nil {} so some one send data to the EditNote using prefer for seg is equal to
        if let note = EditNote{
            noteTitleTF.text = note.title
            noteDetailsTV.text = note.details
        }
        
    }    
    
    @IBAction func saveBtn(_ sender: Any) {
        var newNote:MyNotes?
        // if the note is Editable then implement this code
        if let note = EditNote{
            newNote = note
        // or the note is new create a new context MyNote obj
        }else{
            newNote = MyNotes(context: context)
            
        }
        newNote?.title = noteTitleTF.text
        newNote?.details = noteDetailsTV.text
        newNote?.date_save = NSDate() as Date
        
        do {
            ad.saveContext()
            noteTitleTF.text = ""
            noteDetailsTV.text = ""
        } catch {
            print("Can't Save")
        }
        noteTitleTF.text = ""
        noteDetailsTV.text = ""
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
 
}

