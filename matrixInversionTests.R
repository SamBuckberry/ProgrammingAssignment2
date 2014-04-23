# Create test matrix
myMatrix <- matrix(rnorm(n=10000, mean=100, sd=25), nrow=100, ncol=100)


# Get the inverse matrix
system.time(myInverse <- solve(myMatrix))

# Setup the matrix 
system.time(a <- makeCacheMatrix(myMatrix))

# Solve the matrix
system.time(b <- cacheSolve(a))

# Check the results
all(myInverse==b)