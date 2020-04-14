// https://github.com/Quick/Quick

import Quick
import Nimble
import ReusableViewExtensions
import UIKit

class MyCell: UITableViewCell { }
class MyCollectionCell: UICollectionViewCell { }

class ReusableViewExtensionsSpec: QuickSpec {
    override func spec() {
        describe("ReusableViewExtensions tests") {

            context("Cell extension") {
                it("gives class name for identifier") {
                    expect(MyCell.reuseIdentifier) == "MyCell"
                    expect(MyCollectionCell.reuseIdentifier) == "MyCollectionCell"
                }
                
                it("gives the same value for class and object") {
                    expect(MyCell.reuseIdentifier) == MyCell().identifier
                    expect(MyCollectionCell.reuseIdentifier) == MyCollectionCell().identifier
                }
            }
            
            context("tableView") {
                var tableView: UITableView!
                var dataSource: MockDataSource!
                beforeEach {
                    tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 320, height: 480), style: .plain)
                    dataSource = MockDataSource()
                    tableView.dataSource = dataSource
                    tableView.register(MyCell.self)
                }
                
                it("provides cell") {
                    let cell: MyCell = tableView.dequeue()
                    expect(cell.identifier) == MyCell.reuseIdentifier
                }
                
                it("reuses cell with index path") {
                    tableView.reloadData()
                    let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
                    expect(cell).to(beAKindOf(MyCell.self))
                }
            }
            
            context("collection view") {
                var collectionView: UICollectionView!
                var dataSource: MockCollectionDtaSource!
                beforeEach {
                    let layout = UICollectionViewFlowLayout()
                    layout.itemSize = CGSize(width: 50, height: 50)
                    collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 320, height: 480),
                                                      collectionViewLayout: layout)
                    dataSource = MockCollectionDtaSource()
                    collectionView.dataSource = dataSource
                    collectionView.register(MyCollectionCell.self)
                }
                
                it("reuses cell with index path") {
                    collectionView.reloadData()
                    let cell = collectionView.dataSource?.collectionView(collectionView, cellForItemAt: IndexPath(item: 0, section: 0))
                    expect(cell).to(beAKindOf(MyCollectionCell.self))
                }
            }
        }
    }
}

class MockDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyCell = tableView.dequeue(for: indexPath)
        return cell
    }
}

class MockCollectionDtaSource: NSObject, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MyCollectionCell = collectionView.dequeue(for: indexPath)
        return cell
    }
    
    
}
