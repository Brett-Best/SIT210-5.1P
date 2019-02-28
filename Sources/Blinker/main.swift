import Foundation
import SwiftyGPIO

let gp: GPIO = {
  let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPi3)
  
  guard let gp = gpios[.P4] else {
    fatalError()
  }
  
  return gp
}()

signal(SIGINT) { _ in
  gp.value = 0
  print("Blinker Finished")
  exit(0)
}

gp.direction = .OUT

repeat {
  gp.value = (gp.value == 0) ? 1 : 0
  Thread.sleep(forTimeInterval: 0.25)
} while (true)
