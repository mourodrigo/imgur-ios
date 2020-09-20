import UIKit
import AVKit
import RxSwift
import RxCocoa

class MainGalleryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var upsLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var bottomView: View!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var avplayer: AVPlayer?
    let playerController = AVPlayerViewController()
    let imageRepository = SharedLocator.shared.imageRepository
    private var onLoadError: Error?
    private let _disposeBag = DisposeBag()
    private var _content: GalleryContent?

    func setup(content: GalleryContent) {

        _content = content

        //avoiding misplaced content by cell reuse
        imageView.image = nil
        playerController.view.removeFromSuperview()
        activityIndicator.startAnimating()

        upsLabel.text = "\(content.ups)"
        viewsLabel.text = "\(content.views)"
        commentLabel.text = "\(content.commentCount)"

        switch content.mediaType {
            case .none:
                return
            case .some(let someType):
                switch someType {
                case .image, .gif:
                    setupImage(from: content)
                case .video:
                    setupVideo(from: content)
            }
        }

        self.imageView.rx.tapGesture().when(.recognized).subscribe { [weak self] _ in
            if self?.onLoadError != nil {
                self?.setup(content: content)
            }
        }.disposed(by: _disposeBag)


    }

    private func setupVideo(from content: GalleryContent) {
        guard   let gif = content.images?.first?.mp4,
                let url = URL.init(string: gif) else { return }

        self.avplayer = AVPlayer(url: url)
        playerController.player = self.avplayer
        playerController.view.frame = self.imageView.frame
        playerController.player?.volume = 0
        playerController.entersFullScreenWhenPlaybackBegins = false
        playerController.player?.play()
        playerController.showsPlaybackControls = false
        playerController.view.backgroundColor = bottomView.backgroundColor
        playerController.videoGravity = .resizeAspectFill
        playerController.player?.addObserver(self, forKeyPath: "timeControlStatus", options: [.old, .new], context: nil)
        self.contentView.insertSubview(playerController.view, belowSubview: bottomView)
    }

    private func setupImage(from content: GalleryContent) {
        let link = content.availableMediaLink

        guard let url = URL(string: link) else {
                    print("There is no link to load")
                    return
        }

        imageRepository.getImage(for: url, onSuccess: { [weak self] (image, resolvedURL) in

            if url == resolvedURL {
                print("Content loaded", String(describing: content.type), " ",url)
                self?.imageView.contentMode = .scaleAspectFill
                self?.imageView.image = image
                self?.activityIndicator.stopAnimating()
            }

        }) { (error) in
            self.onLoadError = error
            self.imageView.image = UIImage.init(named: "reload-1")
            self.imageView.contentMode = .center
            print("Content NOT loaded", String(describing: self._content?.type), " ",url)
            self.activityIndicator.stopAnimating()
            self.imageView.backgroundColor = UIColor.gray
        }
    }

    override public func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "timeControlStatus", let change = change, let newValue = change[NSKeyValueChangeKey.newKey] as? Int, let oldValue = change[NSKeyValueChangeKey.oldKey] as? Int {
            if #available(iOS 10.0, *) {
                let oldStatus = AVPlayer.TimeControlStatus(rawValue: oldValue)
                let newStatus = AVPlayer.TimeControlStatus(rawValue: newValue)
                if newStatus != oldStatus {
                   DispatchQueue.main.async {[weak self] in
                       if newStatus == .playing || newStatus == .paused {
                        self!.activityIndicator.stopAnimating()
                       } else {
                        self!.activityIndicator.startAnimating()
                       }
                   }
                }
            } else {
                // Fallback on earlier versions
                self.activityIndicator.stopAnimating()
            }
        }
    }



}
