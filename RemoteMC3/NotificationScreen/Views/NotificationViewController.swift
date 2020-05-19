//
//  NotificationViewController.swift
//  RemoteMC3
//
//  Created by Luiza Fattori on 14/05/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit
import NotificationCenter
import UserNotifications

class NotificationViewController: UIViewController {
	
    var viewModel: NotificationViewModel = NotificationViewModel()

    @IBOutlet weak var notificationCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
		
        navigationController?.navigationBar.prefersLargeTitles = true

        notificationCollectionView.delegate = self
        notificationCollectionView.dataSource = self
		
		viewModel.setNotifications()
    }
    
}

extension NotificationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNotificationsRowsNumber()
    }

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		guard let notificationCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "notificationCell", for: indexPath) as? NotificationCollectionCell else {
			return NotificationCollectionCell()
		}
		
		notificationCollectionCell.backgroundColor = .red
		
		notificationCollectionCell.notificationMessage.text = viewModel.notifications[indexPath.row].requisitor
			+ " desejar participar do projeto " + viewModel.notifications[indexPath.row].projectRequired
		notificationCollectionCell.personImage.image = UIImage(named: viewModel.notifications[indexPath.row].personImage)
		notificationCollectionCell.personImage.layer.cornerRadius =  35
		notificationCollectionCell.backgroundColor = .white
		notificationCollectionCell.layer.masksToBounds = false
		notificationCollectionCell.layer.cornerRadius = 20
		notificationCollectionCell.layer.shadowColor = UIColor.black.cgColor
		notificationCollectionCell.layer.shadowOffset = .zero
		notificationCollectionCell.layer.shadowRadius = 4
		notificationCollectionCell.layer.shadowOpacity = 0.3
		
		return notificationCollectionCell
	}

}

extension NotificationViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: self.view.frame.size.width * 0.9, height: 125)
	}
}