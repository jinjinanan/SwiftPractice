//
//  BookShelfVM.swift
//  Practice
//
//  Created by admin on 2020/10/12.
//

import Foundation
import RealmSwift
import RxSwift
import RxCocoa


class bookSelfVM: Object {
  

    let savedbook = BehaviorSubject<[Book]>(value: [])
    
    func requestBookInShelf() {
        provider.rx.request(.test(path:Api_bookStore_free , param: ["":""])).asObservable().mapHandyJsonModel(BasicTypes.self).subscribe {[unowned self] (event) in
            switch event {
            case .next(let element):
                DLog("OK")
                self.savedbook.onNext(element.data ?? [])
            case .error(_):
                DLog("error")
            case .completed:
                DLog("complete")
            }
        }
    }
}


class testRxVM: Object {
   
    
}

func testObservable() {
    let number : Observable<Int> = Observable.create { (observer) -> Disposable in
        observer.onNext(0)
        observer.onNext(1)
        observer.onNext(2)
        observer.onCompleted()
        return Disposables.create()
    }
    
    number.subscribe { (a) in
        DLog(a)
    } onError: { (b) in
        
    } onCompleted: {
        DLog("完成")
    } onDisposed: {
        
    }

}



func testSubject() {
   testBehaviorSubject()
}

func testAsyncSubject() {
    let disposeBag = DisposeBag()
    let subject = AsyncSubject<String>()
    subject
      .subscribe { print("Subscription: 1 Event:", $0) }
      .disposed(by: disposeBag)

    subject.onNext("🐶")
    subject.onNext("🐱")
    subject.onNext("🐹")
    subject.onCompleted()
}

func testBehaviorSubject()
{
    let disposeBag = DisposeBag()
    let subject = BehaviorSubject(value: "🔴")

    subject
      .subscribe { print("Subscription: 1 Event:", $0) }
      .disposed(by: disposeBag)

    subject.onNext("🐶")
    subject.onNext("🐱")

    subject
      .subscribe { print("Subscription: 2 Event:", $0) }
      .disposed(by: disposeBag)

    subject.onNext("🅰️")
    subject.onNext("🅱️")

    subject
      .subscribe { print("Subscription: 3 Event:", $0) }
      .disposed(by: disposeBag)

    subject.onNext("🍐")
    subject.onNext("🍊")
}



