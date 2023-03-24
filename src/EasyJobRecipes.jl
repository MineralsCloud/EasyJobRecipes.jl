module EasyJobRecipes

using EasyJobs
using Query
using RecipesBase

@userplot TableHist
@recipe function f(obj::TableHist)
    data = obj.args[begin]
    attr = length(obj.args) == 2 ? obj.args[end] : :spent
    values = @from item in data begin
        @select getindex(item, attr)
        @collect
    end
    if attr == :status
        values = map(Int, values)
    end
    indices = eachindex(data)
    framestyle --> :box
    # lims --> extrema(values)
    seriestype --> :histogram
    legend_foreground_color --> nothing
    return indices, values
end

@userplot TablePlot
@recipe function f(obj::TablePlot)
    data = obj.args[begin]
    attr = length(obj.args) == 2 ? obj.args[end] : :spent
    values = @from item in data begin
        @select getindex(item, attr)
        @collect
    end
    indices = eachindex(data)
    framestyle --> :box
    lims --> extrema(values)
    seriestype --> :scatter
    legend_foreground_color --> nothing
    return indices, values
end

end
