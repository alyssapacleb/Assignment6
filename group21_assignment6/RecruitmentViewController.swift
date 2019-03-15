//
//  RecruitmentViewController.swift
//  group21_assignment6
//
//  Created by Argandona Vite, Angel R on 3/14/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit

class RecruitmentViewController: UIViewController, UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var AdventurersCollectionView: UICollectionView!
    
    // Button actions
    @IBAction func cancelRecruitment(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveRecruit(_ sender: Any) {
        self.addAdventurer()
    }
    
    // Collection Cell Identifier
    let indentifier = "AdventurerCollectionCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Check text field
    func addAdventurer() {
        if !(nameTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty) && !(classTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty){
            print("yes")
            self.dismiss(animated: true, completion: nil)
        } else { print("Please enter a valid name and class, asshole.")}
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
