package com.opencv;/*
 *ResignPattern
 *@author yafeng
 *2018-4-10
 *下午7:50
 */

import org.bytedeco.javacv.CanvasFrame;
import org.bytedeco.javacv.FrameGrabber;
import org.bytedeco.javacv.OpenCVFrameGrabber;

import javax.swing.*;

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
                    //如果关闭窗口,则关闭摄像头
                    openCVFrameGrabber.stop();
                    //退出
                    System.exit(0);
                }
                canvasFrame.showImage(openCVFrameGrabber.grab());
                //每50秒刷新一次图像
                Thread.sleep(50);
            }
        } catch (FrameGrabber.Exception e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
