//
//  ReviewTableViewCell.swift
//  kulinary
//
//  Created by Tommy Yon Prakoso on 27/06/22.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var namaRestoranLabel: UILabel!
    @IBOutlet weak var deskripsiLabel: UILabel!
    @IBOutlet weak var menuAndalanLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!

    var data : Kulinary? {
        didSet {
            self.configureCell(with: data)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(with data: Kulinary?) {
        guard let data = data else { return }
        namaRestoranLabel.text = data.namaRestoran
        deskripsiLabel.text = data.deskripsi
        menuAndalanLabel.text = data.menuAndalan
        ratingLabel.text = "\(data.rating ?? 0 )"
    }

    class func nib() -> UINib {
        UINib(nibName: "ReviewTableViewCell", bundle: nil)
    }
    
}
