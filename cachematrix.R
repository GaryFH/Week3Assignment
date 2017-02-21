

## This function creates a special "matrix" object that can cache its inverse.



makeCacheMatrix <- function(x = matrix()) {
        minv <- NULL
        set <- function(y) 
{
 x <<- y
        minv <<- NULL 
}
        get <- function() x
        setinv <- function(inv) minv <<- inv
        getinv <- function() minv
        list(set = set,
             get = get,
             setinv = setinv,
             getinv = getinv)

}

## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above

cacheSolve <- function(x, ...) 
{
        ## return inv matrix of 'x'
        
        minv <- x$getinv()
        if (!is.null(minv)) 
{
        return(minv)
}
              minv <- solve(x$get())
              x$setinv(minv)
        minv
}
