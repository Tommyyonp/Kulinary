//
//  VideoViewController.swift
//  kulinary
//
//  Created by Tommy Yon Prakoso on 27/06/22.
//

import UIKit
import AVFoundation

class VideoViewController: UIViewController {

    @IBOutlet weak var videoView: UIImageView!

    let videoPicker = UIImagePickerController ()


    override func viewDidLoad() {
        super.viewDidLoad()

        videoPicker.delegate = self
        videoPicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary) ?? []
        videoPicker.mediaTypes = ["public.movie"]
    }

    @IBAction func didTapUploadBtn(_ sender: Any) {
        videoPicker.allowsEditing = false
        videoPicker.sourceType = .photoLibrary
        videoPicker.videoQuality = .typeMedium
        present(videoPicker, animated: true, completion: nil)
    }

    func playVideo(path: URL) {
        let player = AVPlayer(url: path)
        var playerLayer : AVPlayerLayer?
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
        playerLayer?.needsDisplayOnBoundsChange = true
        playerLayer?.frame = videoView.layer.bounds
        videoView.layer.addSublayer(playerLayer!)
        player.play()
    }
}

extension VideoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let movieUrl = info[.mediaURL] as? URL else { return }
        playVideo(path: movieUrl)
        self.dismiss(animated: true, completion: nil)
    }
}
