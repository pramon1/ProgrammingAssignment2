## Put comments here that give an overall description of what your
## functions do
## R function able to cache potentially time-consuming computations
## Write a short comment describing this function
##this Programming Assignment will take advantage of the scoping rules of the R language and how they can be manipulated to preserve state inside of an R object

makeCacheMatrix <- function(x = matrix()) {
 inv <- NULL
 set <- function(y) {
        x <<- y
        inv <- NULL
        }
                get <- function() x
                setinverse <- function(inverse) inv <<- inverse
                getinverse <- function() inv
                list(set = set, get = get,
                     setinverse = setinverse,
                     getinverse = getinverse)
}


## Write a short comment describing this function
## This function takes the matrix from the makeCacheMatrix function and derives it's inverse
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        mat <- x$get()
        inv <- solve(mat, ...)
        x$setinverse(inv)
        inv
}
