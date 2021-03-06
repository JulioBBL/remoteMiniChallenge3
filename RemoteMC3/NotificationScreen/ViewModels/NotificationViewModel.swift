//
//  NotificationViewModel.swift
//  RemoteMC3
//
//  Created by Luiza Fattori on 14/05/20.
//  Copyright © 2020 Paula Leite. All rights reserved.
//

import UIKit

class NotificationViewModel {
    var notifications: [Notification] = []
    var requestsNotification: [RequestNotification] = []
    var serverService: ServerService = ServerService()

    func getNotificationsRowsNumber() -> Int {
        return notifications.count
    }

    func getNotificationRequisitor (forNotificationAt index: Int) -> String {
		return notifications[index].requisitor
    }
	
	func getNotificationProjectRequired (forNotificationAt index: Int) -> String {
		return notifications[index].projectRequired
    }

    func getNotificationPerson (forNotificationAt index: Int) -> String {
        return notifications[index].personImage
    }
	
	func getNotification (forNotificationAt index: Int) -> Notification {
        return notifications[index]
    }
	
	func setNotifications () {
		notifications = []
        guard let userID = UserDefaults.standard.string(forKey: "userIDServer") else { return }
        //TODO: Mudar por método que só procura 1 usuário, e não um array
        serverService.getUsersBy(users: [userID], {(result) in
            switch result {
            case .success(let res):
                guard let user = res.result.first else { return }
                guard let projectsIDs = user.projects else { return }
                self.serverService.getProjectsBy(projects: projectsIDs, {(response) in
                    switch response {
                    case .success(let resp):
                        let projects = resp.result
                        for project in projects {
                            for solicitation in project.solicitations {
                                let notification = Notification(personImage: "personalColored", projectRequired: project.title, requisitor: solicitation.userName, requisitorEmail: solicitation.userEmail, projectID: project._id!, userRequisitorID: solicitation.userId)
                                self.notifications.append(notification)
                            }
                        }
                    case .failure(_):
                        print("Projetos não encontrados")
                    }
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reload_notifications"), object: nil)
                })
            case .failure(_):
                print("Usuario não encontrado.")
            }
        })
	}
}
