import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    //分类
    let categoryController = CategoryController()
    
    app.get("category","list", use: categoryController.list)
    
    //用户
    let userController = UserController()
    
    app.group("user") {
        $0.post("signIn", use: userController.signIn)
        $0.post("signUp", use: userController.signUp)
    }
    
    //文章
    let articleController = ArticleController()
    
    app.group("article") {
        $0.get("list", use: articleController.list)
        $0.get("info", use: articleController.info)
    }
    
    //视频
    let videoController = VideoController()
    
    app.group("video") {
        $0.get("list", use: videoController.list)
        $0.get("info", use: videoController.info)
    }
}
