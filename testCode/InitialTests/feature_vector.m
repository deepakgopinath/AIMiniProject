function [ m , va] = feature_vector(audio_name)
 clean_up_audio(audio_name,'clean',4000,12000);
 [sample,fs] = wavread('clean.wav');
 blocklength=4096;
 hoplength=2048;
 [v,t] = ComputeFeature('TimeRms',mean(sample,2),fs,[hann(blocklength,'periodic')],blocklength,hoplength);
 
 v_new=diff(diff(diff(diff(v))));
 v_new(v_new<5)=0;
 
 m=mean(v_new);
 va = var(v_new);
end