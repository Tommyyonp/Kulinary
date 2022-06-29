//
//  PdfViewController.swift
//  kulinary
//
//  Created by Tommy Yon Prakoso on 27/06/22.
//

import UIKit
import PDFKit

class PdfViewController: UIViewController {
    @IBOutlet weak var pdfView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let viewPdf = PDFView(frame: pdfView.bounds)
        pdfView.addSubview(viewPdf)
        viewPdf.autoScales = true

        let url = URL(string: "https://www.orimi.com/pdf-test.pdf")
        guard let url = url else { return }
        if let doc = PDFDocument(url: url) {
            viewPdf.document = doc
        }
    }
}
