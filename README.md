B U S B O Y

graphics-heavy, related to busser

busboy, associated with busser, is responsible for "setting the table" (will take the
role of Chance, in the Abbot build tools) and may do other tasks "otherwise to
assist the waiting staff" (http://en.wikipedia.org/wiki/Busboy)

node.js is getting some very useful graphics libraries such as node-canvas and
node-imagemagick. I have used them already, as shown below, for making thumbnail
images, so am confident about making this part of the build tools set anew.

Work here will start with comparison to Chance in the Abbot build tools, and to
other similar tools, such as Glue, from the python world.

A fresh look will be taken at theming and how it is presently done in SproutCore, 
with an eye # toward new things, such as:

  -- adding a SproutCore app as a driver for busboy, in basic form to present a
     workflow of forms for theme creation from existing parts.

  -- adding a button builder to that app

  -- adding layout options

  -- ...

Consider the basic API, could be # something like:

  busboy.bus(
    action: 'theme'
    ...
  )

(among other actions)

but, of course, could be something boring like busboy.makeTheme(...

