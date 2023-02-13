import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    // collectionview setup
    func setupCollectionView(){
        HomeCollectionView.dataSource = self
        HomeCollectionView.delegate = self
        HomeCollectionView.backgroundColor = .clear
        
        registerCells()
        collectionViewFlowLayoutSetup()
    }
    // Flow Layout Stup
    fileprivate func collectionViewFlowLayoutSetup() {
        let collectionViewCellLayout = UICollectionViewFlowLayout()
        collectionViewCellLayout.scrollDirection = .horizontal
        HomeCollectionView.collectionViewLayout = collectionViewCellLayout
    }
    
    // Cell Registration
    func registerCells(){
        HomeCollectionView.register(ScoreBoardCollectionViewModel.register(), forCellWithReuseIdentifier: ScoreBoardCollectionViewModel.identifier)
        
    }
    // Collectionview Reload
    func reloadCollectionView(){
        DispatchQueue.main.async {
            self.HomeCollectionView.reloadData()
        }
    }
    // Number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mainViewModel.numberOfItems(in: section)
    }
    
    //cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = HomeCollectionView.dequeueReusableCell(withReuseIdentifier: ScoreBoardCollectionViewModel.identifier, for: indexPath) as? ScoreCardCollectionViewCell else{
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width-10, height:HomeCollectionView.bounds.height-50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 2, left: 1, bottom: 2, right: 1)
    }
    
    
}
