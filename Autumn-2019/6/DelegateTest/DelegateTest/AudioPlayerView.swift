//
//  AudioPlayerView.swift
//  DelegateTest
//
//  Created by a.reshetnikov on 28/10/2019.
//  Copyright © 2019 MIPT. All rights reserved.
//
import Foundation
import UIKit

protocol AudioPlayerDelegate: class {
    func playPauseDidTap()
    func playlistDidTap()
}

class AudioPlayerView: UIView {
    //MARK:- IBOutlets
    @IBOutlet weak private var btnPlayPause: UIButton!
    @IBOutlet weak private var btnPlaylist: UIButton!

    // MARK:- Delegate
    weak var delegate: AudioPlayerDelegate?

    // MARK:- IBActions
    @IBAction private func playPauseTapped(_ sender: AnyObject) {
        delegate?.playPauseDidTap()
    }

    @IBAction private func playlistTapped(_ sender: AnyObject) {
        delegate?.playlistDidTap()
    }
}
