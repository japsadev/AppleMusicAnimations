//
//  ViewController.swift
//  AppleMusicAnimations
//
//  Created by Salih Yusuf Göktaş on 30.06.2023.
//

import UIKit

class ViewController: UIViewController {

	
	@IBOutlet weak var albumImageView: UIImageView!
	@IBOutlet weak var reverseBackgroundView: UIView!
	@IBOutlet weak var playPauseBackgroundView: UIView!
	@IBOutlet weak var forwardBackgroundView: UIView!
	
	@IBOutlet weak var reverseButton: UIButton!
	@IBOutlet weak var playPauseButton: UIButton!
	@IBOutlet weak var forwardButton: UIButton!
	
	var isPlaying: Bool = true {
		didSet {
			if isPlaying {
				playPauseButton.setImage(UIImage(named: "pause"), for: .normal)
			} else {
				playPauseButton.setImage(UIImage(named: "play"), for: .normal)
			}
		}
	}
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		albumImageView.layer.shadowColor = UIColor.darkGray.cgColor
		albumImageView.layer.shadowRadius = 4
		albumImageView.layer.shadowOpacity = 0.5
		albumImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
		albumImageView.layer.cornerRadius = 15
		
		
		reverseBackgroundView.layer.cornerRadius = 35
		reverseBackgroundView.clipsToBounds = true
		reverseBackgroundView.alpha = 0
		
		playPauseBackgroundView.layer.cornerRadius = 35
		playPauseBackgroundView.clipsToBounds = true
		playPauseBackgroundView.alpha = 0

		forwardBackgroundView.layer.cornerRadius = 35
		forwardBackgroundView.clipsToBounds = true
		forwardBackgroundView.alpha = 0
		
	}
	
	@IBAction func playPauseButtonTapped(_ button: UIButton) {
		if isPlaying {
			UIView.animate(withDuration: 0.5) {
				self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
			}
		}else {
			UIView.animate(withDuration: 0.5) {
				self.albumImageView.transform = .identity
			}
		}
		
		isPlaying.toggle()
	}
	
	@IBAction func touchedDown(_ button: UIButton) {
		let buttonBackground: UIView
		
		switch button {
		case reverseButton:
			buttonBackground = reverseBackgroundView
		case playPauseButton:
			buttonBackground = playPauseBackgroundView
		case forwardButton:
			buttonBackground = forwardBackgroundView
		default:
			return
		}
		
		UIView.animate(withDuration: 0.25) {
			buttonBackground.alpha = 0.3
			button.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
		}
	}
	
	@IBAction func touchedUpInside(_ button: UIButton) {
		let buttonBackground: UIView
		
		switch button {
		case reverseButton:
			buttonBackground = reverseBackgroundView
		case playPauseButton:
			buttonBackground = playPauseBackgroundView
		case forwardButton:
			buttonBackground = forwardBackgroundView
		default:
			return
		}
		
		UIView.animate(withDuration: 0.25, animations: {
			buttonBackground.alpha = 0
			buttonBackground.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
			button.transform = .identity
		}) { (_) in
			buttonBackground.transform = .identity
		}
	}
	
	@IBAction func reverseButton(_ sender: Any) {
		let newImage = UIImage(named: "nevermind")
		albumImageView.image = newImage
	}
	@IBAction func forwardButton(_ sender: Any) {
		let newImage = UIImage(named: "duman")
		albumImageView.image = newImage
	}
	
}
