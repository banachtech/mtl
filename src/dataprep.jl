using CSV, DataFrames

files = readdir("data/")

for f in files
    df = DataFrame(CSV.File(joinpath("data",f), dateformat="yyyy-mm-dd"))
    hilo = log.(df.High) .- log.(df.Low)
    vol = df.Volume ./ 1_000_000.0
    cl = df[:,"Adj Close"]
    tmp = [cl hilo vol]
    tmp = DataFrame(tmp, [:cl, :hilo, :vol])
    insertcols!(tmp, 1, :date => df.Date)
    CSV.write(joinpath("data","_"*f), tmp)
end