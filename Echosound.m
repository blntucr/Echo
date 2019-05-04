clear all
clc
[audio,fs] = audioread('Sonne.wav');
[rowsize,coulumnsize] = size(audio);
delay = 5000; %number of sample difference between delayed and original sound
delayed = zeros(rowsize,coulumnsize); %creating a matrix with the same size of "audio" to copy the delayed version of the signal in this matrix
b = 1;
while(b <= coulumnsize) %creating a delayed audio matrix
    for a=1:1:(rowsize-delay)
        delayed(a+delay,b) = audio(a,b);
    end
b = b+1;
end
gain = 0.5;
delayed = delayed .* gain; %amplified delayed signal
echoed = audio+delayed;
sound(echoed,fs);