## This couple of functions allow for avoiding repeating time consuming inverse computation of a matrix by creating a list cointaining the matrix itself and allowing for the once compouted inverse to be retrieved from

## Creates a list cointaining the raw data of the matrix and the ability of carrying along its inverse as well

makeCacheMatrix <- function(x = matrix()) {
    I <- NULL
    set <- function(y) {
        x <<- y
        I <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) I <<- inv
    getinverse <- function() I
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## recover the inverse of the raw matrix created using the function above and retrieve its inverse if already computed or compute and append it to the list created by the fuction above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x' 
    # cacheSolve
    # This function computes the inverse of the special "matrix" returned by makeCacheMatrix.
    # If the inverse has already been calculated (and the matrix has not changed),
    # then the cachesolve should retrieve the inverse from the cache.
    
    I <- X$getinverse()
    if(!is.null(I)) {
        message("getting cached data")
        return(I)
    }
    data <- X$get()
    I <- solve(data, ...)
    X$setinverse(I)
    I
}
