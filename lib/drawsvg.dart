import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonData {
  String text;
  Rect rect;
  double leftRadius;
  double rightRadius;

  ButtonData(this.text, this.rect, this.leftRadius, this.rightRadius);
}

Widget buildStack() {
  return LayoutBuilder(builder: (ctx, constraints) {
    var fs = applyBoxFit(BoxFit.contain, Size(32.0, 32.0), constraints.biggest);
    double scale = fs.destination.width / fs.source.width;
    print("sclae $scale");
    List<Widget> children = [
      SvgPicture.asset(
        "images/drawing.svg",
        width: fs.destination.width,
        height: fs.destination.height,
      )
    ];
    var buttons = [
      ButtonData("button 1", Rect.fromLTWH(9.75, 4.75, 14.5, 4.5), 0, 1),
      ButtonData("button 2", Rect.fromLTWH(7.25, 10.75, 14.5, 4.5), 1, 0),
      ButtonData("button 3", Rect.fromLTWH(9.75, 16.75, 14.5, 4.5), 0, 1),
      ButtonData("button 4", Rect.fromLTWH(7.25, 22.75, 14.5, 4.5), 1, 0),
    ];
    children += buttons.map((buttonData) {
      return Positioned(
        left: buttonData.rect.left * scale,
        top: buttonData.rect.top * scale,
        width: buttonData.rect.width * scale,
        height: buttonData.rect.height * scale,
        child: OutlineButton(
          highlightColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(4.5 * scale * buttonData.leftRadius),
              right: Radius.circular(4.5 * scale * buttonData.rightRadius),
            ),
          ),
          onPressed: () {
            print("onPressed ${buttonData.text}");
          },
          child: Text(
            buttonData.text,
            textScaleFactor: 0.225 * scale,
          ),
        ),
      );
    }).toList();

    return Stack(children: children);
  });
}

/*
assets/drawing.svg:

<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   width="32"
   height="32"
   id="svg3352"
   version="1.1"
   inkscape:version="0.91 r"
   viewBox="0 0 32 32"
   sodipodi:docname="drawing.svg">
  <defs
     id="defs3354" />
  <sodipodi:namedview
     id="base"
     pagecolor="#ffffff"
     bordercolor="#666666"
     borderopacity="1.0"
     inkscape:pageopacity="0.0"
     inkscape:pageshadow="2"
     inkscape:zoom="16.75"
     inkscape:cx="16"
     inkscape:cy="16"
     inkscape:current-layer="layer1"
     showgrid="true"
     inkscape:grid-bbox="true"
     inkscape:document-units="px"
     objecttolerance="10000"
     guidetolerance="10000"
     showguides="true"
     inkscape:guide-bbox="true"
     inkscape:window-width="1366"
     inkscape:window-height="717"
     inkscape:window-x="0"
     inkscape:window-y="25"
     inkscape:window-maximized="1">
    <inkscape:grid
       type="xygrid"
       id="grid3360" />
  </sodipodi:namedview>
  <metadata
     id="metadata3357">
    <rdf:RDF>
      <cc:Work
         rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title />
      </cc:Work>
    </rdf:RDF>
  </metadata>
  <g
     id="layer1"
     inkscape:label="Layer 1"
     inkscape:groupmode="layer">
    <path
       id="path4184"
       style="fill:none;fill-rule:evenodd;stroke:#000075;stroke-width:1.0;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
       d="m 6,4 5,0 0,0 11,0.034947 c 1.637555,2e-7 2.965056,1.3275011 2.965056,2.9650564 0,1.6375553 -1.327501,2.9650563 -2.965056,2.9650565 L 9.4650564,10.034947 c -1.6375557,0 -2.9650567,1.327501 -2.9650564,2.965057 2e-7,1.637555 1.3275011,2.965056 2.9650563,2.965056 L 22,16.034947 c 1.637556,0 2.965056,1.327501 2.965056,2.965057 0,1.637555 -1.327501,2.965056 -2.965056,2.965056 L 9.4650564,22.03495 c -1.6375557,0 -2.9650567,1.327501 -2.9650564,2.965057 2e-7,1.637555 1.3275011,2.965056 2.9650563,2.965056 L 20,28 l 5,0 0,0"
       inkscape:connector-curvature="0"
       sodipodi:nodetypes="ccccsccsccsccscccc" />
  </g>
</svg>

 */
