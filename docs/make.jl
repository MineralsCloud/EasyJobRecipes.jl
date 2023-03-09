using EasyJobRecipes
using Documenter

DocMeta.setdocmeta!(EasyJobRecipes, :DocTestSetup, :(using EasyJobRecipes); recursive=true)

makedocs(;
    modules=[EasyJobRecipes],
    authors="singularitti <singularitti@outlook.com> and contributors",
    repo="https://github.com/MineralsCloud/EasyJobRecipes.jl/blob/{commit}{path}#{line}",
    sitename="EasyJobRecipes.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://MineralsCloud.github.io/EasyJobRecipes.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/MineralsCloud/EasyJobRecipes.jl",
    devbranch="main",
)
