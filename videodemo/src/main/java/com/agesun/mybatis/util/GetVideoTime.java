package com.agesun.mybatis.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class GetVideoTime {

  /*  protected String video_path;

    public GetVideoTime(String ffmpegApp)
    {
        this.video_path = ffmpegApp;
    }*/

    /**
     * 将MP4格式的视频，编码格式mpeg4==>h264
     */
    private void transMp4Code(String video_path,String ffmpeg_path){
        List<String> commands = new ArrayList<String>();

        String oldName=video_path.substring(video_path.lastIndexOf("/")+1).substring(0,video_path.substring(video_path.lastIndexOf("/")+1).indexOf("."));
        commands.add(ffmpeg_path);
        commands.add("-i");
        commands.add(video_path);
        commands.add("-f");
        commands.add("mp4");
        commands.add("-acodec");
        commands.add("aac");
        commands.add("-b");
        commands.add("512k");
        commands.add("-ab");
        commands.add("512k");
        commands.add("-vcodec");
        commands.add("libx264");
        commands.add("-profile:v");
        commands.add("baseline");


     /*   commands.add("-y");
        commands.add("-i");
        commands.add(video_path);
        commands.add("-vcodec");
        commands.add("libx264");
        commands.add("-strict");
        commands.add("-2");

        commands.add("-preset");
        commands.add("ultrafast");
        commands.add("-qscale");
        commands.add("8");
        commands.add("-r");
        commands.add("29.97");
        commands.add("-s");
        commands.add("600x500");*/
        commands.add(video_path.substring(0,video_path.lastIndexOf(".")) + ".mp4");
        try {
            ProcessBuilder builder=new ProcessBuilder();
            builder.command(commands);
            builder.redirectErrorStream(true);

            //视频开始转码
            Process process=builder.start();
            BufferedReader br = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line = null;
            while((line = br.readLine()) != null){
                System.out.println("视频转换中："+line);
            }


        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void transfer(String infile,String outfile) {
        String avitoflv = "ffmpeg -i "+infile+" -ar 22050 -ab 56 -f flv -y -s 320x240 "+outfile;
        String flvto3gp = "ffmpeg -i " + infile + " -ar 8000 -ac 1 -acodec amr_nb -vcodec h263 -s 176x144 -r 12 -b 30 -ab 12 " + outfile;
        String avito3gp = "ffmpeg -i " + infile + " -ar 8000 -ac 1 -acodec amr_nb -vcodec h263 -s 176x144 -r 12 -b 30 -ab 12 " + outfile;
        String avitojpg = "ffmpeg -i " + infile + " -y -f image2 -ss 00:00:10 -t 00:00:01 -s 350x240 " + outfile;
        String videoCommend = "ffmpeg -i " + infile + " -vcodec libx264 -r 29.97 -b 768k -ar 24000 -ab 64k -s 1280x720 "
                + outfile;
      /*  String videoCommend = "ffmpeg -i " + infile + "h264"
                + infile;*/
        try {
            Runtime rt = Runtime.getRuntime();
            Process proc = rt.exec(videoCommend);
            InputStream stderr = proc.getErrorStream();
            InputStreamReader isr = new InputStreamReader(stderr);
            BufferedReader br = new BufferedReader(isr);
            String line = null;

            while ( (line = br.readLine()) != null)
                System.out.println(line);

            int exitVal = proc.waitFor();
            System.out.println("Process exitValue: " + exitVal);
        } catch (Throwable t) {
            t.printStackTrace();

        }
    }



    /**
     * 获取视频总时间
     */
    private void getVideoTime(String video_path,String ffmpeg_path) {

        List<String> commands = new ArrayList<String>();
        commands.add(ffmpeg_path);
        commands.add("-i");
        commands.add(video_path);
        try {
            ProcessBuilder builder = new ProcessBuilder();
            builder.command(commands);
            Process p = builder.start();

            //从输入流中读取视频信息
            BufferedReader br = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            StringBuilder stringBuilder = new StringBuilder();
            String line = "";
            while ((line = br.readLine()) != null) {
                stringBuilder.append(line);
            }
            br.close();

            //从视频信息中解析时长
            String regexDuration = "Duration: (.*?), start: (.*?), bitrate: (\\d*) kb\\/s";
            Pattern pattern = Pattern.compile(regexDuration);
            Matcher m = pattern.matcher(stringBuilder.toString());
            if (m.find()) {
                int time = getTimelen(m.group(1));
                System.out.println("视频时长：" + time + "s , 开始时间：" + m.group(2) + ", 比特率：" + m.group(3) + "kb/s");
            }

            String regexVideo = "Video: (.*?), (.*?), (.*?)[,\\s]";
            pattern = Pattern.compile(regexVideo);
            m = pattern.matcher(stringBuilder.toString());
            if (m.find()) {
                System.out.println("编码格式：" + m.group(1) + ", 视频格式：" + m.group(2) + ", 分辨率：" + m.group(3) + "kb/s");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 格式:"00:00:10.68"
    private int getTimelen(String timelen) {
        int min = 0;
        String strs[] = timelen.split(":");
        if (strs[0].compareTo("0") > 0) {
            // 秒
            min += Integer.valueOf(strs[0]) * 60 * 60;
        }
        if (strs[1].compareTo("0") > 0) {
            min += Integer.valueOf(strs[1]) * 60;
        }
        if (strs[2].compareTo("0") > 0) {
            min += Math.round(Float.valueOf(strs[2]));
        }
        return min;
    }



  /*  public void test() {
        getVideoTime("d://c.wmv");
    }*/

    public static void main(String[] args)
    {

        try
        {
            GetVideoTime videotime = new GetVideoTime();
           /* videotime.getVideoTime("C:\\Users\\xuyan\\Desktop\\智慧大屏系统\\上传资源\\video1.mp4","D:\\Java\\ffmpeg\\bin\\ffmpeg.exe");*/
        videotime.getVideoTime("C:\\Users\\xuyan\\Desktop\\screenSystem\\上传资源\\test3.mp4","E:\\nishuai\\example\\视频demo\\ssm-idea\\ssmshrio\\src\\main\\webapp\\tool\\ffmpeg.exe");
/*         videotime.transMp4Code("C:\\Users\\xuyan\\Desktop\\screenSystem\\上传资源\\test2.mp4","E:\\nishuai\\example\\视频demo\\ssm-idea\\ssmshrio\\src\\main\\webapp\\tool\\ffmpeg.exe");*/
          /* videotime.transfer("C:\\Users\\xuyan\\Desktop\\screenSystem\\上传资源\\test2.mp4","C:\\Users\\xuyan\\Desktop\\screenSystem\\上传资源\\test3.mp4");*/
        } catch (Exception e)
        {
            e.printStackTrace();
        }
    }

}
