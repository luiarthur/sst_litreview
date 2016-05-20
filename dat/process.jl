using RCall, PlotlyJS

R"
source('process.R')
viewPred(xvec,latlon)
"

xvec = rcopy("xvec")
latlon = rcopy("latlon")

function maps1()
    marker = attr(size=[20, 30, 15, 10],
                  color=[10, 20, 40, 50],
                  cmin=0,
                  cmax=50,
                  colorscale="Greens",
                  colorbar=attr(title="Some rate",
                                ticksuffix="%",
                                showticksuffix="last"),
                  line_color="black")
    trace = scattergeo(;mode="markers", locations=["FRA", "DEU", "RUS", "ESP"],
                        marker=marker, name="Europe Data")
    #layout = Layout(geo_scope="europe", geo_resolution=50, width=1000, height=550,
    layout = Layout(geo_scope="europe", geo_resolution=50,
                    margin=attr(l=0, r=0, t=10, b=0))
    plot(trace, layout)
end
maps1()
