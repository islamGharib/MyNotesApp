
//  notesTVC.swift
//  MyNotesApp
//
//  Created by Islam Gharib on 10/18/18.
//  Copyright © 2018 Gharib. All rights reserved.
//

import UIKit

class notesTVC: UITableViewCell {

    @IBOutlet weak var LaDate: UILabel!
    @IBOutlet weak var LaDetails: UITextView!
    @IBOutlet weak var LaTitle: UILabel!
    
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setNotes(note: MyNotes){
        LaTitle.text = note.title
        LaDetails.text = note.details
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM-dd-yyyy HH:mm"
        let now = dateFormat.string(from: note.date_save as! Date)
        LaDate.text = now
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
