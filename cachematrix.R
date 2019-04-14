## Put comments here that give an overall description of what your
## functions do

## make an object like instance to save inverse matrix in cache

makeCacheMatrix <- function(x = matrix()) {
        inverse <- matrix(, nrow = 0, ncol = 0)
        set <- function(y) {
                x <<- y
                inverse <<- matrix(, nrow = 0, ncol = 0)
        }
        get <- function() x
        setinverse <- function(solve) inverse <<- solve
        getinverse <- function() inverse
        list(set = set, get = get,
             setinverse = setinverse ,
             getinverse = getinverse )
}


## this function will check if the inverse matirx is not in cache, it will solve the inverse matric and save to cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse <- x$getinverse()
        if(!all(is.na(inverse))) {
                message("getting cached data")
                return(inverse)
        }
        data <- x$get()
        inverse <- solve(data, ...)
        x$setinverse(inverse)
        inverse
}
