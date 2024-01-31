//
//  Coordinators.swift
//  FoodDeliveryApp
//
//  Created by Macbook on 31/1/24.
//

import UIKit

enum CoordinatorType {
    case app
    case onboarding
    case home
    case order
    case list
    case profile
}

protocol CoordinatorProtocol: AnyObject {
    var coordinators: [CoordinatorProtocol] { get set }
    var type: CoordinatorType { get }
    var navigationController: UINavigationController? { get set }
    var coordinatorFinishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func finish()
}

extension CoordinatorProtocol {
    func add(_ childCoordinator: CoordinatorProtocol) {
        coordinators.append(childCoordinator)
    }
    
    func remove(_ childCoordinator: CoordinatorProtocol) {
        coordinators.filter { $0 !== childCoordinator }
    }
}
protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol)
}





