function allTimeDomain( audio_name,figure_name,af_Window, iBlockSize, iHopSize)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
h=figure;
Featurelist = {
    'TimeAcfCoeff',
    'TimeZeroCrossingRate',
    'TimeRms',
    'TimeMaxAcf',
    };

[sample, sr] = audioread(audio_name);
for i=1:length(Featurelist)
    [v,t] = ComputeFeature(char(Featurelist(i)),mean(sample,2),sr,af_Window,iBlockSize,iHopSize);
    plot(t,v);
    name=strcat(Featurelist(i),'_',figure_name,'.jpg');
    print(h,'-djpeg',char(name));
end
close all;
end

