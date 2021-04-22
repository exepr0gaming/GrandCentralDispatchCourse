import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// MARK: - event source (источник событий) -> dispatch source (источник отправки) -> handler (обработка)
/* 		этапы создания dispatch source
1) создаем иточник отправки
	DispatchSource.makeTimerSource()
2) настраиваем источник отправки
	Настраиваем обработки событий или указываем временную информацию, если создаем таймер
3) назначаем нам обработчик отмены работы источника отправки
	?? опционально настраиваем обработчик
4) запускаем .resume для того, чтобы запустить процессы
запуск .resume ,т.к. изначально источник отпр в состоянии ожидания
*/

let queue = DispatchQueue(label: "com.motivation4life", attributes: .concurrent)
let timer = DispatchSource.makeTimerSource(queue: queue)
var result = 0

//настройки таймера
timer.schedule(deadline: .now(), repeating: .seconds(1), leeway: .milliseconds(300))
timer.setEventHandler {
	print("that's all, course completed")
	result+=1
	if result == 3 {
		timer.cancel()
	}
}

timer.setCancelHandler {
	print("timer is canceled, GO LEARN!")
}


timer.resume()



