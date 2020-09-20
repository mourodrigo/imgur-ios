import XCTest
import RxSwift
import RxTest

@testable import imgur_ios

class GalleryViewModelTests: XCTestCase {

    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    // injects a mocked success API inside -> repository inside -> view model
    let viewModel = MainGalleryViewModel(
                            repository: GalleryRepository(
                                        api: MOCKED_APIRequests_Success()
                            ))

    override func setUp() {
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }

    func testViewModelState() throws {

        // creates a RX watcher for the viewmodel state
        let status = scheduler.createObserver(MainGalleryStatus.self)
        viewModel.state.bind(to: status).disposed(by: disposeBag)

        scheduler.start()

        let startAsLoading = status.events.first!.value.element! == .loading
        XCTAssert(startAsLoading, "MainGalleryViewModel must start with .loading state")

        viewModel.fetch()

        let successAfterFetch = status.events.last!.value.element! == .success
        XCTAssert(successAfterFetch, "MainGalleryViewModel have .success state after success fetching")

    }

    func testViewModelContent() throws {

        viewModel.fetch()

        let correctNumberOfItems = viewModel.numberOfItems == 6
        XCTAssert(correctNumberOfItems, "Viewmodel does not returned the same count of items delivered by mocked JSON")

    }

    func testSubItemsContent() throws {

        viewModel.fetch()

        let first = viewModel.item(for: 0)

        XCTAssert(first.id == "BsehABd", "ID of first item doesn't match mocked JSON")
        XCTAssert(first.link == "http://i.imgur.com/BsehABdh.gif", "Link of first item doesn't match mocked JSON")
        XCTAssert(first.mediaType == .some(.gif), "MediaType of first item doesn't match mocked JSON")

        let firstImageOfSecondItem = viewModel.item(for: 1).images?.first
        XCTAssertNotNil(firstImageOfSecondItem, "Second item on JSON must have an image as followind mocked JSON")


    }

}
