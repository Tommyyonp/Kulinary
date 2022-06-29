//
//  HomeViewController.swift
//  kulinary
//
//  Created by Tommy Yon Prakoso on 27/06/22.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {
    @IBOutlet weak var namaRestoranTF: UITextField!
    @IBOutlet weak var deskripsiTF: UITextField!
    @IBOutlet weak var menuAndalanTF: UITextField!
    @IBOutlet weak var ratingTF: UITextField!


    let delegate = UIApplication.shared.delegate as! AppDelegate
    var context : NSManagedObjectContext {
        get {
            return delegate.persistentContainer.viewContext
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func clearTF() {
        namaRestoranTF.text = ""
        menuAndalanTF.text = ""
        deskripsiTF.text = ""
        ratingTF.text = ""
    }

    @IBAction func didTapSubmit(_ sender: Any) {
        guard let namaRestoran = namaRestoranTF.text,
              let deskripsi = deskripsiTF.text,
              let menuAndalan = menuAndalanTF.text,
              let rating = ratingTF.text
        else { return }

        let ratingDecimal = Decimal(string: rating)
        let newKulinary = NSEntityDescription.insertNewObject(forEntityName: "Kulinary", into: context)
        newKulinary.setValue(namaRestoran, forKey: "namaRestoran")
        newKulinary.setValue(deskripsi, forKey: "deskripsi")
        newKulinary.setValue(menuAndalan, forKey: "menuAndalan")
        newKulinary.setValue(ratingDecimal, forKey: "rating")

        do {
            try context.save()
            print("Sukses")
        } catch {
            print("\(error)")
        }

        clearTF()
    }

    @IBAction func didTapReview(_ sender: Any) {
        navigationController?.pushViewController(ReviewViewController(), animated: true)
    }


    @IBAction func didTapImage(_ sender: Any) {
        navigationController?.pushViewController(ImageViewController(), animated: true)
    }

    @IBAction func didTapVideo(_ sender: Any) {
        navigationController?.pushViewController(VideoViewController(), animated: true)
    }

    @IBAction func didTapPdf(_ sender: Any) {
        navigationController?.pushViewController(PdfViewController(), animated: true)
    }

}
