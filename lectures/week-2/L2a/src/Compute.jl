"""
    poweriteration(A::Array{<:Number,2}, v::Array{<:Number,1}; 
        maxiter::Int = 100, ϵ::Float64 = 0.0001)

This function computes the dominant eigenvector and eigenvalue of a matrix using the power iteration method.

### Arguments
- `A::Array{<:Number,2}`: A square matrix of real numbers.
- `v::Array{<:Number,1}`: An initial guess for the eigenvector.
- `maxiter::Int = 100`: The maximum number of iterations (optional).
- `ϵ::Float64 = 0.0001`: The convergence criterion (optional).

### Output
- A tuple containing the dominant eigenvector and eigenvalue.
"""
function poweriteration(A::Array{<:Number,2}, v::Array{<:Number,1}; 
    maxiter::Int = 100, ϵ::Float64 = 0.0001):: Tuple{Array{<:Number,1}, Number}

    # initialize
    loopcount = 1;
    should_we_stop = false;

    while (should_we_stop == false)
        
        # compute the next iteration
        w = A * v;
        w = w / norm(w);

        # check if we should stop
        if (norm(w - v) ≤ ϵ || loopcount ≥ maxiter)
            should_we_stop = true;
            println("Converged in $(loopcount) iterations"); # let the user know how many iterations it took
        else
            v = w; # update the vector
            loopcount = loopcount + 1; # update the loop count
        end
    end
    
    # compute the eigenvalue -
    λ = dot(A * v, v) / dot(v, v);

    # return the result
    return (v, λ);
end

function myQRdecomposition(matrix::Array{<:Number,2})::Tuple{Array{Float64,2}, Array{Float64,2}}
    
    
    # initialize -
    A = matrix; # define the matrix -
    m, n = size(A); # get the size of the matrix -
    Q = zeros(m, n); # initialize the Q matrix -
    R = zeros(n, n); # initialize the R matrix -

    # loop over the columns -
    for j ∈ 1:n

        # get the j-th column -
        v = A[:,j];

        # loop over the columns -
        for i ∈ 1:j-1
            R[i,j] = dot(Q[:,i], A[:,j]);
            v = v - R[i,j] * Q[:,i];
        end

        # normalize the vector -
        R[j,j] = norm(v);
        Q[:,j] = v / R[j,j];
    end

    # return the result -
    return (Q, R);
end