# This set of functions calculates the inverse of a matrix or retreives it
# from the cache if it has been calculated previously.

# The makeCacheMatrix function sets up a list to cache the results of cacheSolve
makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setInverse <- function(solve) inv <<- solve
        getInverse <- function() inv
        list(set = set, get = get,
             setInverse = setInverse,
             getInverse = getInverse)
}

# This function will caclulate the inverse of a matrix, or retrieve it from
# the cache list created using makeCacheMatrix if it has been caclulated 
# previously

# The argument 'x' is the object created by makeCacheMatrix
cacheSolve <- function(x, ...) {
        
        # Return a matrix that is the inverse of matrix 'x'
        inv <- x$getInverse()
        
        # Check if the inverse of the matrix is cached and return
        if(!is.null(inv)) {
                message("getting cached inverse matrix")
                return(inv)
        }
        
        # Calculate the inverse of the matrix
        data <- x$get()
        inv <- solve(data, ...)
        x$setInverse(inv)
        inv
}
