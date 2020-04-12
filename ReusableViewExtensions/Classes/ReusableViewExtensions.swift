//
//  ReusableViewExtensions.swift
//  ReusableViewExtensions
//
//  Created by Artur Gruchała on 04/12/2020.
//  Copyright (c) 2020 Artur Gruchała. All rights reserved.
//

import UIKit
/// Protocol for reusable views
public protocol Reusable: AnyObject {
    /// Identifier of an object - class name
    static var reuseIdentifier: String { get }
    /// Identifier of an object - class name
    var identifier: String { get }
}

public extension Reusable {
    /// Returns `identifier` - class name
    static var reuseIdentifier: String {
        String(describing: self)
    }
    var identifier: String {
        return Self.reuseIdentifier
    }
}

extension UITableViewCell: Reusable { }
extension UICollectionViewCell: Reusable { }


public extension UITableView {
    /// Dequeue table view cell by its type
    /// - Parameter indexPath: index path of new row
    func dequeue<T: Reusable>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    /// Register new cell by its type
    /// - Parameter cellType: cell type to be register
    func register(_ cellType: Reusable.Type) {
        register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
    /// Register cell `Nib` by its type
    /// - Parameters:
    ///   - nibType: cell type, `Nib`/`Xib` file name must be the same as class name.
    ///   - bundle: `Nib`/`Xib` bundle
    func register(nibType: Reusable.Type, bundle: Bundle = .main) {
        register(UINib(nibName: nibType.reuseIdentifier, bundle: bundle),
                 forCellReuseIdentifier: nibType.reuseIdentifier)
    }
}

public extension UICollectionView {
    /// Dequeue collection view cell by its type
    /// - Parameter indexPath: index path of new row
    func dequeue<T: Reusable>(for indexPath: IndexPath) -> T  {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    /// Register new cell by its type
    /// - Parameter cellType: cell type to be register
    func register(_ cellType: Reusable.Type) {
        register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
    }
    
    /// Register cell `Nib` by its type
    /// - Parameters:
    ///   - nibType: cell type, `Nib`/`Xib` file name must be the same as class name.
    ///   - bundle: `Nib`/`Xib` bundle
    func register(nibType: Reusable.Type, bundle: Bundle = .main) {
        register(UINib(nibName: nibType.reuseIdentifier, bundle: bundle),
                 forCellWithReuseIdentifier: nibType.reuseIdentifier)
    }
}
