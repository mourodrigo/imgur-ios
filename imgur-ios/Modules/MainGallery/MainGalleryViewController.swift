import UIKit
import RxSwift
import RxCocoa

class MainGalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let _viewModel: MainGalleryViewModelProtocol = MainGalleryViewModel()
    private let _disposeBag = DisposeBag()

     override func viewDidLoad() {
        super.viewDidLoad()
        setupOnLoad()
    }

    private func setupOnLoad() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self

        _viewModel.state.bind { (status) in
            DispatchQueue.main.async {
                switch status {
                case .success:
                    self.collectionView.reloadData()
                case .loading:
                    break // todo loading
                case .error(error: _):
                    //removes itself if having an error to load
                    self.view.removeFromSuperview()
                }
            }
        }.disposed(by: _disposeBag)


    }
}

extension MainGalleryViewController: UICollectionViewDelegate {

}

extension MainGalleryViewController: UICollectionViewDataSource {

    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        _viewModel.numberOfItems
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let reuseIdentifier = "MainGalleryCollectionViewCell"

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? MainGalleryCollectionViewCell
            else { fatalError("Error while dequeueReusableCell on \(String(describing: self))")}

        let content = _viewModel.item(for: indexPath.row)
        cell.setup(content: content)

        return cell
    }


}
