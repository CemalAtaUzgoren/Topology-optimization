function [fv_merged]=stlmerge(fv1,fv2)
%==========================================================================
%                                DEFINITIONS
%==========================================================================
% 1. PURPOSE: STL formatindaki iki dosyayi birlestirir. 
%            NETFABB uzerinde duzeltmeler yapilacagi icin cakisik node'lar
%            önemsenmemistir.
% 
% 
% 

%==========================================================================
% DIKKAT
%==========================================================================
% fonksiyon icerisinde bulunan stlread stlwrite ile birlikte calismaktadir.
% fonksiyonda belirtilen "vertices" ve "faces" isimleri
% MATLAB kutuphanesinde "Nodes" ve "ConnectivyList" olarak tutulmaktadir.
%

% -INPUT PARAMETERS
%fv         :STL yuzeylere ait "vertices" ve "faces" yapilarinin bulundugu
%           struct yapisi

% -OUTPUT PARAMETERS
% Fv        : birlestirilmis halleri

% 3. OTHERS:
% By : Gorkem Can Ates & Yusuf Yamaner
%==========================================================================
%--------------------------------------------------------------------------
% fv1=  stlread('ornek_on.stl');
% fv2=  stlread('ornek_ust.stl');
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%STL formatinda cakisik node giderme sorunu gozukmedigi icin matrisler
%direkt eklenebilir

% 2. eklenecek olan face' icin node'lari ile uyumlu olması icin 1'in denk
% gelecegi noktanin bulunmasinda ekle kullanilir
ekle=length(fv1.vertices);
modified=fv2.faces+ekle;

fv_merged.vertices=vertcat(fv1.vertices,fv2.vertices);
fv_merged.faces=vertcat(fv1.faces,modified);

% stlwrite('test.stl',fv_karma) 
end



