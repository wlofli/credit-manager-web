package com.xinyue.credit.util;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 生成图形验证码
 * @author 金辉
 *
 */
public class ImageAuthcode {
	public static void authCode(HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		// 首先设置页面不缓存  
        response.setHeader("Pragma", "No-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
  
        // 定义图片的宽度和高度  
        int width = 100, height = 39;  
        // 创建一个图像对象  
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
        // 得到图像的环境对象  
        Graphics g = image.createGraphics();  
  
        Random random = new Random();  
        // 用随机颜色填充图像背景  
        g.setColor(getRandColor(180, 250));  
        g.fillRect(0, 0, width, height);  
        for (int i = 0; i < 5; i++) {  
            g.setColor(getRandColor(50, 100));  
            int x = random.nextInt(width);  
            int y = random.nextInt(height);  
            g.drawOval(x, y, 4, 4);  
        }  
        // 设置字体，下面准备画随机数  
        g.setFont(new Font("", Font.BOLD, 22));  
        // 随机数字符串  
        String sRand = "";  
        for (int i = 0; i < 4; i++) {  
            // 生成四个数字字符  
            String rand = getChar(random.nextInt(62));  
            sRand += rand;  
            // 生成随机颜色  
            g.setColor(new Color(20 + random.nextInt(80), 20 + random  
                    .nextInt(100), 20 + random.nextInt(90)));  
            // 将随机数字画在图像上  
      //      g.drawString(rand, (17 + random.nextInt(3)) * i + 8, 34);
            //计算 x轴坐标
            int r_x = (20) * i + 12 - random.nextInt(6);
            //计算y轴坐标的随机值
            int ry = random.nextInt(7);
            //计算字符缩放的随机值
            int r_s = random.nextInt(11);
            //计算y轴坐标
            int r_y = 28 - 2*ry;
            //计算字符选择角度
            int r_r = r_s %2 == 1 ? 0-ry*4 :ry*4;
            
            RotateString(rand,r_x,r_y ,1.8 + r_s*0.02,1+0.02*r_s,g,r_r);
            
  
            // 生成干扰线  
            for (int k = 0; k < 12; k++) {  
                int x = random.nextInt(width);  
                int y = random.nextInt(height);  
                int xl = random.nextInt(9);  
                int yl = random.nextInt(9);  
                g.drawLine(x, y, x + xl, y + yl); 
                if (k%2==1)
                	g.drawLine(x+1, y+1, x + xl+1, y + yl+1);  
            }  
        }  
  
        // 将生成的随机数字字符串写入Session  
        request.getSession().setAttribute(Globals.LOGIN_CHECK_CODE, sRand);

        // 使图像生效  
        g.dispose();  
        // 输出图像到页面  
        ImageIO.write(image, "JPEG", response.getOutputStream());  
	}
	
    /**
     * 旋转并且画出指定字符串
     * @param s 需要旋转的字符串
     * @param x 字符串的x坐标
     * @param y 字符串的Y坐标
     * @param g 画笔g
     * @param degree 旋转的角度
     */ 
    private static void RotateString(String s,int x,int y,double sx,double sy, Graphics g,int degree) 
    { 
        Graphics2D g2d = (Graphics2D) g.create();                                   
        //   平移原点到图形环境的中心  ,这个方法的作用实际上就是将字符串移动到某一个位置 
        g2d.translate(x-1, y+3);   
        
        g2d.scale(sx, sy);
        //   旋转文本   
         g2d.rotate(degree* Math.PI / 180); 
         //特别需要注意的是,这里的画笔已经具有了上次指定的一个位置,所以这里指定的其实是一个相对位置 
         g2d.drawString(s,0 , 0); 
    } 
       
	
	/** 
     * 产生一个随机的颜色 
     *  
     * @param fc 
     *            颜色分量最小值 
     * @param bc 
     *            颜色分量最大值 
     * @return 
     */  
    private static Color getRandColor(int fc, int bc) {  
        Random random = new Random();  
        if (fc > 255){  
            fc = 255;  
        }  
        if (bc > 255){  
            bc = 255;  
        }  
        int r = fc + random.nextInt(bc - fc);  
        int g = fc + random.nextInt(bc - fc);  
        int b = fc + random.nextInt(bc - fc);  
        return new Color(r, g, b);  
    }  
    
    /**
     * 随机数转化为字符 0~61  0~9 数字  10~35 小写字母 36 ~61 大写字母
     * @param num
     * @return
     */
    private static String getChar(int num){

    	if (num<0)
    		num = 0;
    	
    	if (num>61)
    		num = num % 61;
    	
    	if (num<10){
    		Character re = (char)(48 + num);
    		return re.toString();
    	}
    	
    	if (num<36){
    		num = num-10;
    		Character re = (char)(97 + num);
    		return re.toString();
    	}
    	
    	num = num - 36;
    	Character re = (char)(65+num);
    	return re.toString();
    }
}
