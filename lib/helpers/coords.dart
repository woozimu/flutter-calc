import 'dart:math';

List<double> fromGeoToPixels(double lat, double long, double z) {
  double x_p, y_p;
  List<double> pixelCoords;
  List<int> tilenumber = [];
  double rho;
  double pi = 3.1415926535897932;
  double beta, phi, theta, e = 0.0818191908426;

  rho = pow(2, z + 8) / 2;
  beta = lat * pi / 180;
  phi = (1 - e * sin(beta)) / (1 + e * sin(beta));
  theta = tan(pi / 4 + beta / 2) * pow(phi, e / 2);

  x_p = rho * (1 + long / 180);
  y_p = rho * (1 - log(theta) / pi);

  return [x_p, y_p];
}

List<int> fromPixelsToTileNumber(double x, double y) {
  return [
    (x / 256).floor(),
    (y / 256).floor(),
  ];
}

List<int> getTileNumber(double x, double y, double z) {
  var pixelCoords = fromGeoToPixels(x, y, z);
  return fromPixelsToTileNumber(pixelCoords[0], pixelCoords[1]);
}
