import Foundation
import UIKit

// MARK: - Collectionview  delegate and datasource

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    // collectionview setup
    func setupCollectionView(){
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        homeCollectionView.backgroundColor = .clear
        homeCollectionView.addShadow(opecity: 0.8, size: 1, radius: 2, color: UIColor.darkGray)
        registerCells()
        collectionViewFlowLayoutSetup()
    }
    
    // Flow Layout Stup
    fileprivate func collectionViewFlowLayoutSetup() {
        let collectionViewCellLayout = UICollectionViewFlowLayout()
        collectionViewCellLayout.scrollDirection = .horizontal
        homeCollectionView.collectionViewLayout = collectionViewCellLayout
    }
    
    // Cell Registration
    func registerCells(){
        homeCollectionView.register(ScoreCardCVModel.register(), forCellWithReuseIdentifier: ScoreCardCVModel.identifier)
    }
    
    // Collectionview Reload
    func reloadCollectionView(){
        DispatchQueue.main.async {
            self.homeCollectionView.reloadData()
        }
    }
    
    // Number of items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mainViewModel.numberOfItems(in: section)
    }
    
    //cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: ScoreCardCVModel.identifier, for: indexPath) as? ScoreCardCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.setupCell(viewModel: collectionViewData[indexPath.row])
        return cell
    }
    
    // did select
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.matchDetailsVCStoryboardID)  as? MatchDetailsViewController
        viewController?.fixtureId = self.collectionViewData[indexPath.row].id
        navigationController?.pushViewController(viewController!, animated: true)
    }
    
    // If user scroll tableview the collectionview will animated
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let _ = scrollView as? UITableView{
            if scrollView.contentOffset.y > 35 {
                upScrollAnimation()
            }else if scrollView.contentOffset.y < 0 {
                downScrollAnimation()
            }
            
        }
    }
    
    // MARK: Animations
    fileprivate func upScrollAnimation() {
        UIView.animate(withDuration: 0.7) { [weak self] in
            self?.navigationBarView.alpha = 0
//            self?.navigationBarView.isHidden = false
            self?.collectionViewHeightConstraint.constant = 270
            self?.collectionViewHeightConstraint.constant = 0
            self?.view.layoutIfNeeded()
        }
    }
    
    fileprivate func downScrollAnimation() {
        UIView.animate(withDuration: 0.7) { [weak self] in
//            self?.navigationBarView.isHidden = true
            self?.navigationBarView.alpha = 1
            self?.collectionViewHeightConstraint.constant = 0
            self?.collectionViewHeightConstraint.constant = 270
            self?.navigationBarView.isHidden = false
            self?.view.layoutIfNeeded()
        }
    }
    
}

// MARK: - Collectionview Flow Layout

extension ViewController: UICollectionViewDelegateFlowLayout{
    // cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width-10, height:homeCollectionView.bounds.height-50)
    }
    // Minimum linse spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    // insets
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 2, left: 1, bottom: 2, right: 1)
    }
}
