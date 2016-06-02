$(function(){
  var xscale = d3.scale.linear().domain([0,100]).range([0,650]),
  yscale = d3.scale.linear().domain([0,100]).range([0,760]),
  map = d3.floorplan().xScale(xscale).yScale(yscale),
  imagelayer = d3.floorplan.imagelayer(),
  // heatmap = d3.floorplan.heatmap(),
  vectorfield = d3.floorplan.vectorfield(),
  // pathplot = d3.floorplan.pathplot(),
  // overlays = d3.floorplan.overlays(),
  mapdata = {};

  mapdata[imagelayer.id()] = [{
    url: '/assets/plane-example.jpg',
    x: 0,
    y: 0,
    height: 100,
    width: 100
  }];

  map.addLayer(imagelayer).addLayer(vectorfield);
  //  .addLayer(heatmap)
  //  .addLayer(pathplot)
  //  .addLayer(overlays);

  d3.json("/assets/demo-data.json", function(data) {
    // mapdata[heatmap.id()] = data.heatmap;
    // mapdata[overlays.id()] = data.overlays;
    mapdata[vectorfield.id()] = data.vectorfield;
    // mapdata[pathplot.id()] = data.pathplot;

    d3.select("#demo").append("svg")
    .attr("height", 760).attr("width",650)
    .datum(mapdata).call(map);
  });
});
