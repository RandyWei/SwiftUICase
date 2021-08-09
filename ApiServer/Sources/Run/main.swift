import App
import Vapor

var env = try Environment.detect()
try LoggingSystem.bootstrap(from: &env)
let app = Application(env)
//配置本地地址
app.http.server.configuration.hostname = "172.27.25.85"
defer { app.shutdown() }
try configure(app)
try app.run()
