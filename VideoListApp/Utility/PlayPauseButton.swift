//
//  PlayPauseButton.swift
//  VideoListApp
//
//  Created by Mert Köksal on 4.07.2022.
//

import UIKit
import AVFoundation
import AVKit

class PlayPauseButton: UIView {
    var kvoRateContext = 0
    var avPlayer: AVPlayer?
    var isPlaying: Bool {
        return avPlayer?.rate != 0 && avPlayer?.error == nil
    }

    func addObservers() {
        avPlayer?.addObserver(self, forKeyPath: "rate", options: .new, context: &kvoRateContext)
    }

    func setup(in container: UIViewController) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapped(_:)))
        addGestureRecognizer(gesture)

        updatePosition()
        updateUI()
        addObservers()
    }

    @objc func tapped(_ sender: UITapGestureRecognizer) {
        updateStatus()
        updateUI()
    }

    func updateStatus() {
        if isPlaying {
            avPlayer?.pause()
        } else {
            avPlayer?.play()
        }
    }

    func updateUI() {
        if isPlaying {
            setBackgroundImage(name: "pause")
        } else {
            setBackgroundImage(name: "play")
        }
    }
    
    func updatePosition() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 100),
            heightAnchor.constraint(equalToConstant: 100),
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor)
            ])
    }

    private func setBackgroundImage(name: String) {
        UIGraphicsBeginImageContext(frame.size)
        UIImage(named: name)?.draw(in: bounds)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        backgroundColor = UIColor(patternImage: image)
    }

    private func handleRateChanged() {
        updateUI()
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let context = context else { return }

        switch context {
        case &kvoRateContext:
            handleRateChanged()
        default:
            break
        }
    }
}
