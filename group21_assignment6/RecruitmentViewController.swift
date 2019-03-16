//
//  RecruitmentViewController.swift
//  group21_assignment6
//
//  Created by Argandona Vite, Angel R on 3/14/19.
//  Copyright © 2019 Pacleb, Alyssa June N. All rights reserved.
//

import UIKit
import CoreData

class RecruitmentViewController: UIViewController, UITextFieldDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    // Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var classTextField: UITextField!
    @IBOutlet weak var AdventurersCollectionView: UICollectionView!
    
    // Variables
    var adventurers: [String] = []
    let identifier = "recruitmentCollectionViewCell"
    private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    private let itemsPerRow: CGFloat = 3
    
    // Button actions
    @IBAction func cancelRecruitment(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveRecruit(_ sender: Any) {
        self.addAdventurer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accessPlist()
        print(adventurers)
        //AdventurersCollectionView.register(UICollectionViewCell.self, forCellReuseIdentifier: "recruitmentCollectionViewCell")
    }

    private func accessPlist() {
        let inputFile = Bundle.main.path(forResource:"Adventurers",
                                         ofType: "plist")
        let inputArray = NSArray(contentsOfFile: inputFile!)
        for item in inputArray as! [String] {
            adventurers.append(item)
        }
    }
    
    // Check text field
    func addAdventurer() {
        if !(nameTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty) && !(classTextField.text!.trimmingCharacters(in: .whitespaces).isEmpty){
            print("yes")
            self.dismiss(animated: true, completion: nil)
        } else { print("Please enter a valid name and class, asshole.")}
        
    }
    
    // Flow Layout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    // Collection View functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: "recruitmentCollectionViewCell", for: indexPath) as! RecruitmentCollectionViewCell
        cell.displayContent(image: UIImage(named: adventurers[indexPath.row])!)
        return cell
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
