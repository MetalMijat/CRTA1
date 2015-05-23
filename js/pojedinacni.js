function pojedinacniGraf(){

var margin = {top: 20, right: 20, bottom: 30, left: 80},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;


var x = d3.scale.ordinal()
    .rangeRoundBands([0, width], .1);

var y = d3.scale.linear()
    .range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left");
    //.ticks(10, "%");

// var tip = d3.tip()
//   .attr('class', 'd3-tip')
//   .offset([-10, 0])
//   .html(function(d) {
//     return "<span style='color:red'>" + d.prihod + "</span>";
//   });

var svg = d3.select("#pojedinacniDijagram").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

// svg.call(tip);

d3.json("poslanici.json",  function(error, data) {
  x.domain(data.map(function(d) { return d.poslanik; }));
  y.domain([0, d3.max(data, function(d) { return d.prihod; })]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis)
      .append("text");

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("prihod");

  svg.selectAll(".bar")
      .data(data)
    .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function(d) { return x(d.poslanik); })
      .attr("width", x.rangeBand())
      .attr("y", function(d) { return y(d.prihod); })
      .attr("height", function(d) { return height - y(d.prihod); })
      // .on('mouseover', tip.show)
      // .on('mouseout', tip.hide)

});

function type(d) {
  d.prihod = +d.prihod;
  return d;
}
}