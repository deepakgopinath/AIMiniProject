function clean_up_audio(audio_name,clean_audio_name,start_freq,end_freq);

[Y,FS,NBITS]=wavread(audio_name);

n = 7;
beginFreq = start_freq / (FS/2);
endFreq = end_freq / (FS/2);
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');

%Filter the signal
fOut = filter(b, a, Y);


wavwrite(fOut,FS,NBITS,clean_audio_name);
end