abstract type MyAbstractUnsupervisedClusteringAlgorithm end


mutable struct MyNaiveKMeansClusteringAlgorithm <: MyAbstractUnsupervisedClusteringAlgorithm

    # data -
    K::Int64 # number of clusters
    centriods::Dict{Int64, Vector{Float64}} # cluster centriods
    assigments::Vector{Int64} # cluster assignments
    ϵ::Float64 # convergence criteria
    maxiter::Int64 # maximum number of iterations (alternatively, could use this convergence criteria)
    dimension::Int64 # dimension of the data
    number_of_points::Int64 # number of data points

    # constructor -
    MyNaiveKMeansClusteringAlgorithm() = new(); # build empty object
end