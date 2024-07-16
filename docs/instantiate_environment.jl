import Pkg

@info "Changing working directory to $(@__DIR__)"
cd(@__DIR__)
Pkg.activate(Base.current_project())

# Add HDF5.jl as a dev dependency
Pkg.develop(; path="..")

# Add all packages under filter/ as a dev dependency
filters = ["H5Zbitshuffle", "H5Zblosc", "H5Zbzip2", "H5Zlz4", "H5Zzstd"]
for filter in filters
    @info "Running `]develop $filter`"
    Pkg.develop(; path=joinpath("..", "filters", filter))
end

Pkg.instantiate()
