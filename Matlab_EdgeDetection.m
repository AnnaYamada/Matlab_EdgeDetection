clc;clear;close all;
video = "test.mp4"; %视频路径
vidObj = VideoReader(video);

%读取总帧数
a=2;
nFrames = vidObj.NumberOfFrames;
vFrameRate = vidObj.FrameRate;
fs=44100; %音频采样率
[audio_input, fs] = audioread(video);
sound(audio_input, fs);

%t1=clock;
for i = 1 : nFrames
     t1=clock;
     frame = read(vidObj,i);%读取某帧
     %pause(1/(vFrameRate*a*1.21*1.0423*1.2216));%调节延时
     frame=rgb2gray(frame);
     frame=edge(frame,'prewitt');%边缘提取
     frame=uint8(frame)*255;
     image(frame);colormap(flipud(bone));title("Bad Apple");
     i
     t2=clock;
     dTime=etime(t2,t1);
     pause(1/(vFrameRate)-dTime);%调节延时，稳定帧率
     
end
%t2=clock;
%dTime=etime(t2,t1);

%vidObj.Duration;
%clear sound

