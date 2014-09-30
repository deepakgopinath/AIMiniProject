 
function allSpectral(audio_name,figure_name,afWindow,iBlockLength,iHopLength);
h=figure;

Feature_list={
   'SpectralCentroid',
   'SpectralCrest',
   'SpectralDecrease',
   'SpectralFlatness',
   'SpectralFlux',
   'SpectralKurtosis',
   'SpectralMfccs',
   'SpectralPitchChroma',
   'SpectralRolloff',
   'SpectralSkewness',
   'SpectralSlope',
   'SpectralSpread',
  'SpectralTonalPowerRatio'
 };

[sample,Fs] = wavread(audio_name);
for i=1:length(Feature_list);
    
    [v,t] = ComputeFeature(char(Feature_list(i)),mean(sample,2),Fs,afWindow,iBlockLength,iHopLength);
    plot(t,v);
    name=strcat(Feature_list(i),'_',figure_name,'.jpg');
    print(h,'-djpeg',char(name));
end
close all;

end