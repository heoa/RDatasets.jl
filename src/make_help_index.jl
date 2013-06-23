function make_help_index(datasets_csv_name::String, output_file_dir::String)
    output_file_dir = Pkg.dir("RDatasets", "doc")

    output_file_name = joinpath(output_file_dir, "_JL_INDEX_")
    d = readtable(datasets_csv_name)

    f = open(output_file_name, "w")
    @printf f "RDatasets  README  A package with datasets originally distributed with R or R add-on packages\n"
    for idx in 1:nrow(d)
        file_location = match(r".*/doc/(.*)\.html", d["doc"][idx]).captures[1]
        @printf f "%s  %s  %s\n" d["Item"][idx] file_location d["Title"][idx]
    end
    close(f)

    return
end

function make_help_index(name::String)
    make_help_index(name, Pkg.dir("RDatasets", "doc"))
end

function make_help_index()
    datasets_filename = Pkg.dir("RDatasets", "doc", "datasets.csv")
    make_help_index(datasets_filename, Pkg.dir("RDatasets", "doc"))
end
