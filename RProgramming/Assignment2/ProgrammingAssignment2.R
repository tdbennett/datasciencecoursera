### Programming Assignment 2 (week 3)


# setwd("your working directory")  # first set working directory

# this function takes the inverse of a matrix and caches it
# the "list" object can be accessed 
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(solve) {inv <<- solve}
    getinv <- function() {inv}
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}

# this function takes the inverse of a matrix if it is not already 
# available in the cache and returns it
cacheSolve <- function(w, ...) {
    inv <- w$getinv()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- w$get()
    inv <- solve(data, ...)
    w$setinv(inv)
    inv
}



q <- matrix(rnorm(100), 10, 10)
solve(q)

objectq <- makeCacheMatrix(q)
cacheSolve(objectq)
cacheSolve(objectq)

a = matrix(1:4, 2, 2)
solve(a)

objecta <- makeCacheMatrix(a)
cacheSolve(objecta)
cacheSolve(objecta)

