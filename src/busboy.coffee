# busboy.coffee
#
# busboy, as part of busser, is responsible for "setting the table" (will take the
# role of Chance, in the Abbot build tools) and will do other tasks "otherwise to
# assist the waiting staff" (http://en.wikipedia.org/wiki/Busboy)
#
# node.js is getting some very useful graphics libraries such as node-canvas and
# node-imagemagick. I have used them already, as shown below, for making thumbnail
# images, so am confident about making this part of the build tools set anew.
#
# Work here will start with comparison to Chance in the Abbot build tools, and to
# other similar tools, such as Glue, from the python world.
#
# A fresh look will be taken at theming and how it is presently done in SproutCore, 
# with an eye # toward new things, such as:
#
#   -- adding a SproutCore app as a driver for busboy, in basic form to present a
#      workflow of forms for theme creation from existing parts.
#
#   -- adding a button builder to that app
#
#   -- adding layout options
#
#   -- ...
#
# JGP, 2012-01-23
#
# Consider also the name busser.coffee... but, as busboy, the invocation, could be
# something like:
#
#   busboy.bus(
#     action: 'theme'
#     ...
#   )
#
# but, of course, something boring like busboy.makeTheme(...
#
#




#
# Use of im (node-imagemagick) from the uploading branch of Thoth
#
#
#
#
#im.identify(['-format', '%wx%h', proxyPath], function(err, output){
#//im.identify(proxyPath, function(err, features){
#  if (err) {
#    sys.log('im.identify error!');
#    callback(SC.Error.create({ message: 'There was a problem im.identifying your uploaded image.'}));
#  } else {
#    console.log('im.identify ' + output);
#    // { format: 'JPEG', width: 3904, height: 2622, depth: 8 }
#    var width = parseInt(output.split('x')[0]),
#        height = parseInt(output.split('x')[1]);
#
#    callback({ mimeType: 'text/url', imageWidth: width, imageHeight: height, filePath: proxyPath, filename: file.filename });
#  }
#});
#




#
# A use of canvas (node-canvas) from the uploading branch of Thoth
#
#
#
#
#// For a given canvasWidth, canvasHeight, calculate the imageWidth, imageHeight needed
#// to maintain aspect ratio.
#calculateThumbnailData: function(imageWidth, imageHeight, canvasWidth, canvasHeight) {
#  var x = 0,
#      y = 0,
#      resizeWidth = canvasWidth,
#      resizeHeight = canvasHeight;
#
#  if ((imageWidth / imageHeight) >= 1) {
#    resizeWidth = canvasWidth;
#    resizeHeight = (imageHeight * canvasWidth) / imageWidth;
#  } else {
#    resizeWidth = (imageWidth * canvasHeight) / imageHeight;
#    resizeHeight = canvasHeight;
#  } 
#  x = (resizeWidth === canvasWidth) ? 0 : (canvasWidth - resizeWidth) / 2;
#  y = (resizeHeight === canvasHeight) ? 0 : (canvasHeight - resizeHeight) / 2;
#
#  return { x: x, y: y, resizeWidth: resizeWidth, resizeHeight: resizeHeight };
#},
#
# This is the bit where thumbnails are created async.
#
#if (data) {
#//
#// This is an example of how im might be used with streams.
#//
#//var im = require('imagemagick'),*/
#//
#//fs = require('fs');
#//
#//conv = im.convert(['-resize', '640x', '-', '/tmp/kitten-640.jpg'])
#//output = fs.createWriteStream('/tmp/kitten-640.jpg');
#//input = fs.createReadStream('/tmp/kitten.jpg');
#//conv.on('data', function(chunk) { output.write(chunk, 'binary'); });
#//conv.on('end', function() { output.end(); } );
#//input.on('data', function(chunk) { conv.stdin.write(chunk, null); });
#//input.on('end', function() { conv.stdin.end(); });
#//
#//
#                        // Create thumbnails of different sizes: 32, 64, 128, 256, 512,
#                        // and when done with the last, return the urls.
#                        //
#                        // Thumbnails are written to an ./upload dir. This could be changed to a dir proxied
#                        // by nginx, for example.
#                        //
#                        var img32 = new Canvas.Image;
#                        img32.onerror = function(err) { throw err; };
#                        img32.onload = function(){
#                          var canvas = new Canvas(32, 32), 
#                              ctx = canvas.getContext('2d'),
#                              td = me.calculateThumbnailData(data.imageWidth, data.imageHeight, 32, 32);
#                          
#                          ctx.drawImage(img32, td.x, td.y, td.resizeWidth, td.resizeHeight);
#                          canvas.toBuffer(function(err, buf){
#                            var outfile32 =  'tn' +  32 + 'x' +  32 + '_' + data.filename;
#                            fs.writeFile('./images/' + outfile32, buf, function(){               
#                              sys.log('Resized and saved ' + outfile32);
#                            });
#                          });
#                        };
#                        img32.src = data.filePath;
#
#                        var img64 = new Canvas.Image;
#                        img64.onerror = function(err) { throw err; };
#                        img64.onload = function(){
#                          var canvas = new Canvas(64, 64), 
#                              ctx = canvas.getContext('2d'),
#                              td = me.calculateThumbnailData(data.imageWidth, data.imageHeight, 64, 64);
#                          
#                          ctx.drawImage(img64, td.x, td.y, td.resizeWidth, td.resizeHeight);
#                          canvas.toBuffer(function(err, buf){
#                            var outfile64 =  'tn' +  64 + 'x' +  64 + '_' + data.filename;
#                            fs.writeFile('./images/' + outfile64, buf, function(){
#                              sys.log('Resized and saved ' + outfile64);
#                            });
#                          });
#                        };
#                        img64.src = data.filePath;
#
#                        var img128 = new Canvas.Image;
#                        img128.onerror = function(err) { throw err; };
#                        img128.onload = function(){
#                          var canvas = new Canvas(128, 128), 
#                              ctx = canvas.getContext('2d'),
#                              td = me.calculateThumbnailData(data.imageWidth, data.imageHeight, 128, 128);
#                          
#                          ctx.drawImage(img128, td.x, td.y, td.resizeWidth, td.resizeHeight);
#                          canvas.toBuffer(function(err, buf){
#                            var outfile128 =  'tn' +  128 + 'x' +  128 + '_' + data.filename;
#                            fs.writeFile('./images/' + outfile128, buf, function(){
#                              sys.log('Resized and saved ' + outfile128);
#                            });
#                          });
#                        };
#                        img128.src = data.filePath;
#
#                        var img256 = new Canvas.Image;
#                        img256.onerror = function(err) { throw err; };
#                        img256.onload = function(){
#                          var canvas = new Canvas(256, 256), 
#                              ctx = canvas.getContext('2d'),
#                              td = me.calculateThumbnailData(data.imageWidth, data.imageHeight, 256, 256);
#                          
#                          ctx.drawImage(img256, td.x, td.y, td.resizeWidth, td.resizeHeight);
#                          canvas.toBuffer(function(err, buf){
#                            var outfile256 =  'tn' +  256 + 'x' +  256 + '_' + data.filename;
#                            fs.writeFile('./images/' + outfile256, buf, function(){
#                              sys.log('Resized and saved ' + outfile256);
#                            });
#                          });
#                        };
#                        img256.src = data.filePath;
#
#                        var img512 = new Canvas.Image;
#                        img512.onerror = function(err) { throw err; };
#                        img512.onload = function(){
#                          var canvas = new Canvas(512, 512), 
#                              ctx = canvas.getContext('2d'),
#                              td = me.calculateThumbnailData(data.imageWidth, data.imageHeight, 512, 512);
#                          
#                          ctx.drawImage(img512, td.x, td.y, td.resizeWidth, td.resizeHeight);
#                          canvas.toBuffer(function(err, buf){
#                            var outfile512 =  'tn' +  512 + 'x' +  512 + '_' + data.filename;
#                            fs.writeFile('./images/' + outfile512, buf, function(){
#                              sys.log('Resized and saved ' + outfile512);
#                              sys.log('returning with uploaded image url');
#
#                              // Set uploadProgress back to 0.0 for the next upload
#                              me.uploadModule.uploadProgress = 0.0;
#
#                              // Should this response be done, instead with send200?
#                              response.writeHead(200, {'Content-Type': 'application/json' });
#                              response.write(JSON.stringify( { mimeType: 'text/url', imageURL: '/images/' + data.filename } ));
#                              response.end();
#                            });
#                          });
#                        };
#                        img512.src = data.filePath;
#
