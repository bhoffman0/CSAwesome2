import java.awt.*;
import java.awt.font.*;
import java.awt.geom.*;
import java.awt.image.BufferedImage;
import java.text.*;
import java.util.*;
import java.util.List; // resolves problem with java.awt.List and java.util.List

/**
 * A class that represents a picture.  This class inherits from 
 * SimplePicture and allows the student to add functionality to
 * the Picture class.  
 * 
 * Copyright Georgia Institute of Technology 2004-2005
 * @author Barbara Ericson ericson@cc.gatech.edu
 */
public class Picture extends SimplePicture 
{
  ///////////////////// constructors //////////////////////////////////
  
  /**
   * Constructor that takes no arguments 
   */
  public Picture ()
  {
    /* not needed but use it to show students the implicit call to super()
     * child constructors always call a parent constructor 
     */
    super();  
  }
  
  /**
   * Constructor that takes a file name and creates the picture 
   * @param fileName the name of the file to create the picture from
   */
  public Picture(String fileName)
  {
    // let the parent class handle this fileName
    super(fileName);
  }
  
  /**
   * Constructor that takes the width and height
   * @param width the width of the desired picture
   * @param height the height of the desired picture
   */
  public Picture(int width, int height)
  {
    // let the parent class handle this width and height
    super(width,height);
  }
  
  /**
   * Constructor that takes a picture and creates a 
   * copy of that picture
   */
  public Picture(Picture copyPicture)
  {
    // let the parent class do the copy
    super(copyPicture);
  }
  
  /**
   * Constructor that takes a buffered image
   * @param image the buffered image to use
   */
  public Picture(BufferedImage image)
  {
    super(image);
  }
  
  ////////////////////// methods ///////////////////////////////////////
  
         /** 
        zeroBlue() method sets the blue values at all pixels to zero 
     */
      public void zeroBlue()
      {
        Pixel[][] pixels = this.getPixels2D();

        for (Pixel[] rowArray : pixels)
         {
           for (Pixel p: rowArray)
           {
                  p.setBlue(0);
           }
        }
      }
     
        
      /* mirrorVertical() */
      public void mirrorVertical()
      {
           Pixel[][] pixels = this.getPixels2D();
           Pixel leftPixel = null;
           Pixel rightPixel = null;
           int width = pixels[0].length;
           for (int row = 0; row < pixels.length; row++)
           {
                for (int col = 0; col < width / 2; col++)
                {
                     leftPixel = pixels[row][col];
                     rightPixel = pixels[row][width - 1 - col];
                     rightPixel.setColor(leftPixel.getColor());
                }
           }
      }
      
       /** copy from the passed fromPic to the
         * specified startRow and startCol in the
         * current picture
         * @param fromPic the picture to copy from
         * @param startRow the start row to copy to
         * @param startCol the start col to copy to
         */
       public void copy(Picture fromPic, 
                      int startRow, int startCol)
       {
         Pixel fromPixel = null;
         Pixel toPixel = null;
         Pixel[][] toPixels = this.getPixels2D();
         Pixel[][] fromPixels = fromPic.getPixels2D();
         for (int fromRow = 0, toRow = startRow; 
              fromRow < fromPixels.length &&
              toRow < toPixels.length; 
              fromRow++, toRow++)
         {
           for (int fromCol = 0, toCol = startCol; 
                fromCol < fromPixels[0].length &&
                toCol < toPixels[0].length;  
                fromCol++, toCol++)
           {
             fromPixel = fromPixels[fromRow][fromCol];
             toPixel = toPixels[toRow][toCol];
             toPixel.setColor(fromPixel.getColor());
           }
         }   
       }

  public void edgeDetection(int edgeDist)
      {
           Pixel leftPixel = null;
           Pixel rightPixel = null;
           Pixel[][] pixels = this.getPixels2D();
           Color rightColor = null;
           for (int row = 0; row < pixels.length; row++)
           {
                for (int col = 0; col < pixels[0].length-1; col++)
                {
                     leftPixel = pixels[row][col];
                     rightPixel = pixels[row][col+1];
                     rightColor = rightPixel.getColor();
                     if (leftPixel.colorDistance(rightColor) >
                     edgeDist)
                        leftPixel.setColor(Color.BLACK);
                     else
                        leftPixel.setColor(Color.WHITE);
                }
           }
      }
      
  /**
   * Method to return a string with information about this picture.
   * @return a string with information about the picture such as fileName,
   * height and width.
   */
  public String toString()
  {
    String output = "Picture, filename " + getFileName() + 
      " height " + getHeight() 
      + " width " + getWidth();
    return output;
    
  }
 

  
} // this } is the end of class Picture, put all new methods before this
 