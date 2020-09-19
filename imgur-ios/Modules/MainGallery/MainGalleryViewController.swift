import UIKit
import RxSwift
import RxCocoa
import RxGesture

class MainGalleryViewController: UICollectionViewController {

    @IBOutlet weak var backgroundView: UIView!
//    @IBOutlet weak var collectionView: UICollectionView!
    private let _viewModel: MainGalleryViewModelProtocol = MainGalleryViewModel()
    private let _disposeBag = DisposeBag()
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnLoad()
    }

    private func setupOnLoad() {
        self.navigationItem.title = _viewModel.moduleTitle

        self.collectionView.delegate = self
//        self.collectionView.dataSource = self

        refreshControl.tintColor = UIColor.white
//        self.collectionView.refreshControl = refreshControl

        refreshControl.addTarget(self, action: #selector(fetch), for: .valueChanged)
        self.refreshControl.beginRefreshing()

        _viewModel.state.bind { (status) in
            DispatchQueue.main.async {
                self.backgroundView.isHidden = true
                self.refreshControl.endRefreshing()
                switch status {
                case .success:
                    self.collectionView.reloadData()
                case .loading:
                    break // todo loading
                case .error(error: _):
                    self.backgroundView.isHidden = false
                    //removes itself if having an error to load
                }
            }
        }.disposed(by: _disposeBag)

        backgroundView.rx.tapGesture().bind { [weak self] _ in
            self?.refreshControl.beginRefreshing()
            self?.fetch()
        }.disposed(by: _disposeBag)


    }

    @objc private func fetch() {
        _viewModel.fetch()
    }
}

//*************************************************
// MARK: - UICollectionView Delegate
//*************************************************

extension MainGalleryViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _viewModel.didSelectItem(at: indexPath.row)
    }
}

//*************************************************
// MARK: - UICollectionView DataSource
//*************************************************

extension MainGalleryViewController {

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        _viewModel.numberOfItems
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let reuseIdentifier = "MainGalleryCollectionViewCell"

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? MainGalleryCollectionViewCell
            else { fatalError("Error while dequeueReusableCell on \(String(describing: self))")}

        let content = _viewModel.item(for: indexPath.row)
        cell.setup(content: content)

        return cell
    }


}

//*************************************************
// MARK: - UICollectionView Layout
//*************************************************

extension MainGalleryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        var width: Double {
            let safeAreaInsets = UIApplication.shared.connectedScenes
            .lazy
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .first?
            .windows
            .first { $0.isKeyWindow }?
            .safeAreaInsets

            let screenSize = UIScreen.main.bounds.size
            let isLandscape = screenSize.width > screenSize.height

            let spacing = 24.0 // defined by design
            let columns = isLandscape ? 2 : 1

            let left = safeAreaInsets?.left ?? 0
            let right = safeAreaInsets?.right ?? 0
            let safeWidth = Double(screenSize.width - left - right)
            return (safeWidth-spacing)/Double(columns)
        }


        let aspectRatio = 1.44 //defined by design

        let height = width / aspectRatio

        return CGSize(width: width,
                      height: height)
    }
}
