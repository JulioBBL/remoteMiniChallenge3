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
    }
    
}

extension NotificationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNotificationsRowsNumber()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let notificationCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "notificationCell", for: indexPath) as! NotificationCollectionCell

            notificationCollectionCell.backgroundColor = .white
            notificationCollectionCell.layer.cornerRadius = 20
            notificationCollectionCell.notificationMensage.text = viewModel.notifications[indexPath.row].mensage
            notificationCollectionCell.personImage.image = viewModel.notifications[indexPath.row].personImage
            notificationCollectionCell.personImage.layer.cornerRadius = 50
            notificationCollectionCell.layer.shadowColor = UIColor.black.cgColor
            notificationCollectionCell.layer.shadowOffset = .zero
            notificationCollectionCell.layer.shadowRadius = 4
            notificationCollectionCell.layer.shadowOpacity = 0.3

            return notificationCollectionCell
    }

}

extension NotificationViewController: UICollectionViewDelegate {

}
