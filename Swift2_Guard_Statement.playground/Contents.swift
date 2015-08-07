//: Playground - noun: a place where people can play

// a simple example to show how guard statement works
struct iOSDevelopmentBlog {
    let name: String?
    let URL: String?
    let Author: String?
}

func originalStyleComplimentAboutBlog(blog: iOSDevelopmentBlog) {
    if let blogName = blog.name {
        print("The \(blogName) blog is a great iOS development blog!")
    } else {
        print("I don't know the name of this blog, but it's good one!")
    }
}

var newBlog = iOSDevelopmentBlog(name: nil, URL: nil, Author: nil)
originalStyleComplimentAboutBlog(newBlog)

newBlog = iOSDevelopmentBlog(name: "AAA", URL: "http://www.somesite.com", Author: "Jon")
originalStyleComplimentAboutBlog(newBlog)

func guardStyleComplimentAboutBlog(blog: iOSDevelopmentBlog) {
    guard let blogName = blog.name else {
        print("I don't know the name of this blog, but it's a good one!")
        return
    }
    
    print("The \(blogName) blog is a great iOS Development Blog!")
}

newBlog = iOSDevelopmentBlog(name: nil, URL: nil, Author: nil)
guardStyleComplimentAboutBlog(newBlog)

newBlog = iOSDevelopmentBlog(name: "BBB", URL: "http://www.anothersite.com", Author: "Adam")
guardStyleComplimentAboutBlog(newBlog)


// a long example
func originalStyleLongComplimentAboutBlog(blog: iOSDevelopmentBlog) {
    
    if let blogName = blog.name {
        print("The \(blogName) blog is a great iOS Development Blog!")
        
        if let blogAuthor = blog.Author {
            print("It is written by \(blogAuthor).")
            
            if let blogURL = blog.URL {
                print("Visit it at \(blogURL)")
            } else {
                print("Search for it on your favorite on your favorite search engine.")
            }
        } else {
            print("it is written by an unknown author.")
        }
    } else {
        print("I don't know the name of this blog, but it's a good one!")
    }
    
}

let NSHipsterBlog = iOSDevelopmentBlog(name: "NSHipster", URL: "http://nshipster.com/", Author: "Nate Cook")
originalStyleLongComplimentAboutBlog(NSHipsterBlog)


func guardStyleLongComplimentAboutBlog(blog: iOSDevelopmentBlog) {
    
    guard let blogName = blog.name else {
        print("I don't know the name of this blog, but it's a good one!")
        return
    }
    
    print("The \(blogName) blog is a great iOS Development Blog!")
    
    guard let blogAuthor = blog.Author else {
        print("it is written by an unknown author.")
        return
    }
    
    print("It is written by \(blogAuthor).")
    
    guard let blogURL = blog.URL else {
        print("Search for it on your favorite on your favorite search engine.")
        return
    }
    
    print("Visit it at \(blogURL)")
}

guardStyleLongComplimentAboutBlog(NSHipsterBlog)

func compoundGuardStyleLongComplimentAboutBlog(blog: iOSDevelopmentBlog) {
    
    guard let blogName = blog.name,
        let blogURL = blog.URL,
        let blogAuthor = blog.Author else {
            print("My information is incomplete, but I'm sure this iOS Development Blog is great!")
            return
    }
    
    print("The \(blogName) blog is a great iOS Development Blog!")
    print("It is written by \(blogAuthor).")
    print("")
    print("Visit it at \(blogURL)")
}

compoundGuardStyleLongComplimentAboutBlog(NSHipsterBlog)


// guard in loop
let maybeNumbers: [Int?] = [3, 7, nil, 12, 40]

//// transfer control with break
for maybeValue in maybeNumbers {
    
    guard let value = maybeValue else {
        print("No Value")
        break
    }
    
    print(value)
}

//// transfer control with continue
for maybeValue in maybeNumbers {
    
    guard let value = maybeValue else {
        print("No Value")
        continue
    }
    
    print(value)
}

//// transfer control with some specified function

let certainNumbers: [Int?] = [1, 2, 3, 4, 5]
for certainValue in certainNumbers {
    
    guard let value = certainValue else {
        preconditionFailure("No value")
    }
    
    print(value)
}
