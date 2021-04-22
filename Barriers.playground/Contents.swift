import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class SafeArray<El> {
	private var array = [El]()
	private var queue = DispatchQueue(label: "BarrierDispatch", attributes: .concurrent)
	
	func append(element: El) {
		queue.async(flags: .barrier) {
			self.array.append(element)
		}
	}
	
//	var elements: [El] {
//		var result = [El]()
//		queue.sync {
//			result = self.array
//		}
//		return result
//	}
	var elements: [El] {
		queue.sync { self.array }
	}
	
}

var safeArray = SafeArray<Int>()
DispatchQueue.concurrentPerform(iterations: 30) { (index) in
	safeArray.append(element: index)
}
print("safeArray: \(safeArray.elements)")
