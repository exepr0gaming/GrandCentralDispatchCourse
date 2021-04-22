//
//  SecondViewController.swift
//  GCD_queues
//
//  Created by admin on 19.04.2021.
//

import UIKit

class SecondViewController: UIViewController {
	
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	@IBOutlet weak var imageView: UIImageView!
	
	fileprivate var imageURL: URL?
	fileprivate var image: UIImage? {
		get {
			imageView.image
		}
		set {
			activityIndicator.startAnimating()
			imageView.image = newValue
			imageView.contentMode = .scaleAspectFill
			activityIndicator.isHidden = true
			
		}
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setImage()
		delay(seconds: 3) {
			self.alertLogin()
		}
	}
	
	fileprivate func delay(seconds: Int, closure: @escaping () -> ()) {
		DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds)) {
			closure()
		}
	}
	
	private func setImage() {
		imageURL = URL(string: "https://avatars.mds.yandex.net/get-kinopoisk-image/1777765/c7487a56-2e0c-4004-85fe-2033b8e571f3/360")
		activityIndicator.isHidden = false
		activityIndicator.startAnimating()
		let queue = DispatchQueue.global(qos: .utility)
		queue.async {
			guard
				let url = self.imageURL,
				let imageData = try? Data(contentsOf: url)
			else { return }
			
			DispatchQueue.main.async {
				self.image = UIImage(data: imageData)
			}
		}
	}
	
	fileprivate func alertLogin() {
		let ac = UIAlertController(title: "Hello boy", message: "Введи логин и пароль", preferredStyle: .alert)
		let okAction = UIAlertAction(title: "Ok", style: .default)
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
		ac.addAction(okAction)
		ac.addAction(cancelAction)
		
		ac.addTextField { (userNameTF) in
			userNameTF.placeholder = "Enter your login"
		}
		ac.addTextField { (userPassword) in
			userPassword.placeholder = "Enter your password"
			userPassword.isSecureTextEntry = true
		}
		
		present(ac, animated: true)
	}
	
	
}
