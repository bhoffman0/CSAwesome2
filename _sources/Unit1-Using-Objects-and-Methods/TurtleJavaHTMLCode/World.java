      import javax.swing.*;
      import java.util.List;
      import java.util.ArrayList;
      import java.util.Iterator;
      import java.util.Observer;
      import java.awt.*;

      import java.net.*;
      import java.io.*;
      //  import javax.xml.bind.DatatypeConverter;
      // Using java.util.Base64 instead of javax.xml.bind
      import java.util.Base64;
      import javax.imageio.*;
      import java.awt.image.*;
      import javax.imageio.stream.*;


      /**
       * Class to represent a 2d world that can hold turtles and
       * display them
       *
       * Copyright Georgia Institute of Technology 2004
       * @author Barb Ericson ericson@cc.gatech.edu
       */
      public class World implements ModelDisplay
      {
        ////////////////// fields ///////////////////////

        /** should automatically repaint when model changed */
        private boolean autoRepaint = true;

        /** the background color for the world */
        private Color background = Color.white;

        /** the width of the world */
        private int width = 640;

        /** the height of the world */
        private int height = 480;

        /** speed/delay in drawing */
        private int delay = 50;

        /** the list of turtles in the world */
        private List<Turtle> turtleList = new ArrayList<Turtle>();

        /** background picture */
        private Picture picture = null;

        /* All world changes*/
        private List<Picture> worldHistory = new ArrayList<Picture>();


        ////////////////// the constructors ///////////////

        /**
         * Constructor that takes no arguments
         */
        public World()
        {
          // set up the world and make it visible
          initWorld(true);
        }

        /**
         * Constructor that takes a boolean to
         * say if this world should be visible
         * or not
         * @param visibleFlag if true will be visible
         * else if false will not be visible
         */
        public World(boolean visibleFlag)
        {
          initWorld(visibleFlag);
        }

        /**
         * Constructor that takes a width and height for this
         * world
         * @param w the width for the world
         * @param h the height for the world
         */
        public World(int w, int h)
        {
          width = w;
          height = h;

          // set up the world and make it visible
          initWorld(true);
        }

        ///////////////// methods ///////////////////////////

        /**
         * Method to initialize the world
         * @param visibleFlag the flag to make the world
         * visible or not
         */
        private void initWorld(boolean visibleFlag)
        {
          // create the background picture
          picture = new Picture(width,height);
          this.modelChanged();
        }

        /**
         * Method to get the graphics context for drawing on
         * @return the graphics context of the background picture
         */
        public Graphics getGraphics() { return picture.getGraphics(); }

        /**
         * Method to clear the background picture
         */
        public void clearBackground() { picture = new Picture(width,height); }

        /**
         * Method to get the background picture
         * @return the background picture
         */
        public Picture getPicture() { return picture; }

        /**
         * Method to set the background picture
         * @param pict the background picture to use
         */
        public void setPicture(Picture pict) { picture = pict; }

        /**
         * Method to paint this component
         * @param g the graphics context
         */
        public synchronized void paintComponent(Graphics g)
        {
          Turtle turtle = null;

          // draw the background image
          g.drawImage(picture.getImage(),0,0,null);

          // loop drawing each turtle on the background image
          Iterator iterator = turtleList.iterator();
          while (iterator.hasNext())
          {
            turtle = (Turtle) iterator.next();
            turtle.paintComponent(g);
          }
        }

        /**
         * Method to get the last turtle in this world
         * @return the last turtle added to this world
         */
        public Turtle getLastTurtle()
        {
          return (Turtle) turtleList.get(turtleList.size() - 1);
        }


        /**
         * Method to add a model to this model displayer
         * @param model the model object to add
         */
        public void addModel(Object model)
        {
          turtleList.add((Turtle) model);
        }

        /**
         * Method to check if this world contains the passed
         * turtle
         * @return true if there else false
         */
        public boolean containsTurtle(Turtle turtle)
        {
          return (turtleList.contains(turtle));
        }

        /**
         * Method to remove the passed object from the world
         * @param model the model object to remove
         */
        public void remove(Object model)
        {
          turtleList.remove(model);
        }

        /**
         * Method to get the width in pixels
         * @return the width in pixels
         */
        public int getWidth() { return width; }

        /**
         * Method to get the height in pixels
         * @return the height in pixels
         */
        public int getHeight() { return height; }

        /**
         * Method to set the speed of animation by setting the delay to between 0-100. 
         * 50 is the default.
         * @param speed
         */
        public void setSpeed(int d) { 
           if (d >= 0 && d <= 100) 
               delay = d;
        }

        /**
         * Method that allows the model to notify the display
         */
        public void modelChanged()
        {
           Picture p = new Picture(this.width, this.height);
           this.paintComponent(p.getGraphics());
           this.worldHistory.add(p);
        }

        /**
         * Method to set the automatically repaint flag
         * @param value if true will auto repaint
         */
        public void setAutoRepaint(boolean value) { autoRepaint = value; }

        /**
         * Method to show the frame
         */
        public void show()
       {
          this.show(false);
        }

        public void show(boolean showHistory) {
            this.paintComponent(this.picture.getGraphics());
            if(showHistory) {
                try {
                    BufferedImage[] images = new BufferedImage[this.worldHistory.size()];
                    for(int i = 0; i < this.worldHistory.size(); i++) {
                        images[i] = ((Picture) this.worldHistory.get(i)).getBufferedImage();
                    }
                    Giffer.generateFromBI(images, "history.gif", delay, false);

                    File history = new File("history.gif");

                    URL url = history.toURI().toURL();

                    byte[] imageBytes = downloadUrl(url);
                    String result = //DatatypeConverter.printBase64Binary(imageBytes);
                    //BH: using java.util.Base64 instead of java.xml.bind.DataTypeConverter
                    Base64.getEncoder().encodeToString(imageBytes);
                    
                    System.gc();
                    history.delete();
                    double rand = Math.random();
                    System.out.println("&ltimg src=\"data:image/gif;base64," + result + "\"/>");

                } catch (IOException e) {
                    e.printStackTrace();
                }

            } else {
                this.picture.show();
            }
        }

        private byte[] downloadUrl(URL toDownload) {
          ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

          try {
              byte[] chunk = new byte[4096];
              int bytesRead;
              InputStream stream = toDownload.openStream();

              while ((bytesRead = stream.read(chunk)) > 0) {
                  outputStream.write(chunk, 0, bytesRead);
              }
              //toDownload.close();

          } catch (IOException e) {
              e.printStackTrace();
              return null;
          }

          return outputStream.toByteArray();
      }

        /**
         * Method to get the list of turtles in the world
         * @return a list of turtles in the world
         */
        public List getTurtleList()
        { return turtleList;}

        /**
         * Method to get an iterator on the list of turtles
         * @return an iterator for the list of turtles
         */
        public Iterator getTurtleIterator()
        { return turtleList.iterator();}

        /**
         * Method that returns information about this world
         * in the form of a string
         * @return a string of information about this world
         */
        public String toString()
        {
          return "A " + getWidth() + " by " + getHeight() +
            " world with " + turtleList.size() + " turtles in it.";
        }

      } // end of World class

    
    
