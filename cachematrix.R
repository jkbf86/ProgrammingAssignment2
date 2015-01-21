## Creating a special matrix, which stores a matrix and caches its inversion

## Function makeCacheMatrix creates a special matrix, which contains a function 
## to set the value of the matrix, get the value of the matrix, set the matrix 
## inversion and get the matrix inversion

makeCacheMatrix <- function(x = matrix()) {
	s <- NULL
	set <- function(y) {
		x <<- y
		s <<- NULL
	}
	get <-function() x
	setsolve <- function(solve) s <<- solve
	getsolve <- function() s
	list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## Function cacheSolve calculates the inversion of the special matrix created 
## with the above function. It first checks if the inversion has already been 
## calculated - in that case it gets the inversion from the cache and skips
## the computation

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <-x$getsolve()
        if(!is.null(i)) {
        	message("getting cached data")
        	return(m)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setsolve(i)
        i
}