import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let q = DispatchQueue(label: "com.motivation4life", attributes: .concurrent)
let group = DispatchGroup()

q.async(group: group) {
	for i in 0...10 {
		if i == 10 {
			print(i)
		}
	}
}

q.async(group: group) {
	for i in 0...20 {
		if i == 20 {
			print(i)
		}
	}
}

group.notify(queue: .main) {
	print("in Group: group - all completed")
}

let secondGroup = DispatchGroup()
secondGroup.enter()
q.async(group: group) {
	for i in 0...30 {
		if i == 30 {
			print(i)
			secondGroup.leave()
		}
	}
}

let result = secondGroup.wait(timeout: .now() + 1)
print("result is \(result)")

group.notify(queue: .main) {
	print("in Group: secondGroup - all completed")
}

print("this print should be higher than the last one")
