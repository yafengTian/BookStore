package com.tyf.Junit4;

import javax.swing.JFrame;

import org.bytedeco.javacv.CanvasFrame;
import org.bytedeco.javacv.FrameGrabber;
import org.bytedeco.javacv.OpenCVFrameGrabber;

public class JavaOpenCv {
    public static void main(String[] args) {
        OpenCVFrameGrabber openCVFrameGrabber=new OpenCVFrameGrabber(0);
        try {
            openCVFrameGrabber.start();//获取摄像头数据
            CanvasFrame canvasFrame=new CanvasFrame("摄像头");
            canvasFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);//新建一个窗口
            canvasFrame.setAlwaysOnTop(true);
            while (true){
                if(!canvasFrame.isDisplayable()){
                    openCVFrameGrabber.stop();
                    System.exit(0);
                }
                canvasFrame.showImage(openCVFrameGrabber.grab());
                Thread.sleep(50);
            }
        } catch (FrameGrabber.Exception e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
